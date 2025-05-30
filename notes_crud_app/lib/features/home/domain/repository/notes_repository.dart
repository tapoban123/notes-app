import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';

abstract class NotesRepository {
  Future<void> insertNoteIntoDb(NoteEntity note);
  Future<List<NoteEntity>?> fetchNotesFromDb();
  Future<void> updateNoteInDb(NoteEntity newNote);
  Future<void> deleteNoteInDb(String noteId);
}
