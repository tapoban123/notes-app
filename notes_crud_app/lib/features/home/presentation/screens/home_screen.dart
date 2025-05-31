import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/note_tile.dart';
import 'package:notes_crud_app/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotesController notesController;

  @override
  void initState() {
    notesController = Get.find();
    notesController.fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.editOrAddScreen.route);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        // if (notesController.isLoading.value) {
        //   showProgressIndicator();
        // }
        if (notesController.fetchingNotes.value) {
          return showProgressIndicator();
        }
        if (notesController.notes.isEmpty) {
          return Center(
            child: Text(
              "You do not have any notes.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: notesController.notes.length,
            itemBuilder: (context, index) {
              final note = notesController.notes[index];

              return Dismissible(
                key: Key(note.noteId),
                background: SizedBox(),
                direction: DismissDirection.endToStart,
                secondaryBackground: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.delete, color: Colors.red),
                  ),
                ),

                confirmDismiss: (direction) async {
                  return await showDialog(
                    context: context,
                    builder: (context) => showConfirmDeleteDialog(),
                  );
                },
                onDismissed: (direction) async {
                  await notesController.deleteNote(note.noteId);

                  if (context.mounted) {
                    showSnackBar(
                      context,
                      message: "Your note has been deleted.",
                    );
                  }
                },
                child: NoteTile(noteData: note),
              );
            },
          ),
        );
      }),
    );
  }

  Widget showConfirmDeleteDialog() {
    return AlertDialog(
      title: Text("Delete Note"),
      content: Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back(result: true);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
