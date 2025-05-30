import 'package:notes_crud_app/features/home/data/models/note_model.dart';

abstract class NotesLocalDatasource {
  Future<int>  insertNoteIntoDb(NoteModel note);
  Future<List<NoteModel>> fetchNotesFromDb();
  Future<int>  updateNoteInDb(NoteModel newNote);
  Future<int>  deleteNoteInDb(String noteId);
}
