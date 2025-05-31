import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';

abstract class DeletedNotesRepository {
  Future<void> addNewNote(NoteEntity note);
  Future<List<NoteEntity>?> fetchAllNotes();
  Future<void> removeNote(String noteId);
  Future<void> deleteAllDeletedNotes();
}