import 'package:notes_crud_app/features/home/data/models/note_model.dart';

abstract class DeletedNotesRepository {
  Future<void> addNewNote(NoteModel note);
  Future<List<NoteModel>?> fetchAllNotes();
  Future<void> removeNote(String noteId);
}