import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/note_textfield.dart';
import 'package:uuid/uuid.dart';

class AddOrEditNoteScreen extends StatefulWidget {
  const AddOrEditNoteScreen({super.key});

  @override
  State<AddOrEditNoteScreen> createState() => _AddOrEditNoteScreenState();
}

class _AddOrEditNoteScreenState extends State<AddOrEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late bool isEditNote;
  late NoteEntity? noteData;
  late NotesController _notesController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _notesController = Get.find();

    Map<String, dynamic> arguments = Get.arguments ?? {};
    isEditNote = arguments["isEditNote"] ?? false;
    noteData = arguments["noteData"];

    if (noteData != null) {
      _titleController.text = noteData!.title;
      _contentController.text = noteData!.content;
    }

    super.initState();
  }

  final dateTimeStyle = TextStyle(
    fontSize: 11,
    color: Colors.white.withValues(alpha: 0.5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditNote ? "Edit Note" : "Create New Note"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0).copyWith(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            noteData != null && noteData!.updatedAt != null
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Last Modifed on ${formatDate(DateTime.fromMillisecondsSinceEpoch(noteData!.updatedAt!))} at ${formatTime(DateTime.fromMillisecondsSinceEpoch(noteData!.updatedAt!))}",
                    style: dateTimeStyle,
                  ),
                )
                : SizedBox.shrink(),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  NoteTextfield(
                    textController: _titleController,
                    hintText: "Title",
                  ),
                  SizedBox(height: 10),
                  NoteTextfield(
                    textController: _contentController,
                    hintText: "Content",
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            noteData != null
                ? Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDate(
                          DateTime.fromMillisecondsSinceEpoch(noteData!.createdAt),
                        ),
                        style: dateTimeStyle,
                      ),
                      Text(
                        formatTime(
                          DateTime.fromMillisecondsSinceEpoch(noteData!.createdAt),
                        ),
                        style: dateTimeStyle,
                      ),
                    ],
                  ),
                )
                : SizedBox.shrink(),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (isEditNote) {
                    final updatedNote = NoteEntity(
                      noteId: noteData!.noteId,
                      title: _titleController.text,
                      content: _contentController.text,
                      createdAt: noteData!.createdAt,
                      updatedAt: DateTime.now().millisecondsSinceEpoch,
                    );
                    _notesController.updateNote(updatedNote);
                  } else {
                    final note = NoteEntity(
                      noteId: Uuid().v4(),
                      title: _titleController.text,
                      content: _contentController.text,
                      createdAt: DateTime.now().millisecondsSinceEpoch,
                    );

                    _notesController.createNote(note);
                  }
                  Get.back();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.amber,
              ),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
