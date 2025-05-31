import 'package:notes_crud_app/features/home/data/models/note_model.dart';

abstract class DeletedNotesLocalDatasource {
  Future<int> addNewNote(NoteModel note);
  Future<List<NoteModel>?> fetchAllNotes();
  Future<int> removeNote(String noteId);
  Future<int> deleteAllDeletedNotes();
}