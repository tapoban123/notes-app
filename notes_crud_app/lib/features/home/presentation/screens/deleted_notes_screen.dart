import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/deleted_notes_controller/deleted_notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller/notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/confirm_dialog.dart';

class DeletedNotesScreen extends StatefulWidget {
  const DeletedNotesScreen({super.key});

  @override
  State<DeletedNotesScreen> createState() => _DeletedNotesScreenState();
}

class _DeletedNotesScreenState extends State<DeletedNotesScreen> {
  late DeletedNotesController deletedNotesController;
  late NotesController notesController;

  @override
  void initState() {
    deletedNotesController = Get.find<DeletedNotesController>();
    notesController = Get.find<NotesController>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      deletedNotesController.fetchDeletedNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deleted Notes"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => showConfirmDialog(
                      context,
                      title: "Delete all notes permanently",
                      content:
                          "This action cannot be undone. Once you delete all your notes permanently, you can never restore them. Are you sure you want to continue?",
                      onCancel: () {
                        Get.back();
                      },
                      onContinue: () {
                        deletedNotesController.deleteAllDeletedNotes();
                        showSnackBar(
                          context,
                          message: "Your notes have been permanently deleted.",
                          textColor: Colors.white,
                          backgroundColor: Colors.red,
                        );
                        Get.back();
                      },
                    ),
              );
            },
            icon: Icon(Icons.delete_sweep, color: Colors.red),
          ),
        ],
      ),
      body: Obx(() {
        if (deletedNotesController.fetchingDeletedNotes.value) {
          return showProgressIndicator();
        }
        if (deletedNotesController.deletedNotes.isEmpty) {
          return Center(
            child: Text(
              "You do not have any deleted notes.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: deletedNotesController.deletedNotes.length,
          itemBuilder: (context, index) {
            final note = deletedNotesController.deletedNotes[index];

            return Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        note.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            deletedNotesController.removeFromDeletedNotes(
                              note.noteId,
                            );
                            notesController.createNote(note);

                            showSnackBar(
                              context,
                              message: "Your note has been restored.",
                              backgroundColor: Colors.amberAccent,
                            );
                          },
                          child: Icon(Icons.restore_from_trash),
                        ),
                        SizedBox(width: 5),
                        PopupMenuButton(
                          menuPadding: EdgeInsets.all(0),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Text("Delete Permanently"),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder:
                                        (context) => showConfirmDialog(
                                          context,
                                          title: "Delete Note permanently",
                                          content:
                                              "If you delete the note permanently you can never restore it. Are you sure you want to continue?",
                                          onCancel: () {
                                            Get.back();
                                          },
                                          onContinue: () {
                                            deletedNotesController
                                                .removeFromDeletedNotes(
                                                  note.noteId,
                                                );
                                            Get.back();

                                            showSnackBar(
                                              context,
                                              message:
                                                  "Your note has been deleted permanently.",
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                            );
                                          },
                                        ),
                                  );
                                },
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                subtitle: Text(note.content, maxLines: 2),
              ),
            );
          },
        );
      }),
    );
  }
}
