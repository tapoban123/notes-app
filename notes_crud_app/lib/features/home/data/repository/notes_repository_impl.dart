import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/data/datasources/notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/models/note_model.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';

class NotesRepositoryImpl extends NotesRepository {
  final NotesLocalDatasource _notesLocalDatasource;

  NotesRepositoryImpl({required NotesLocalDatasource notesLocalDatasource})
    : _notesLocalDatasource = notesLocalDatasource;

  @override
  Future<void> insertNoteIntoDb(NoteEntity note) async {
    try {
      final noteData = note.toMap();
      final response = await _notesLocalDatasource.insertNoteIntoDb(
        NoteModel.fromMap(noteData),
      );
      logMessage("NOTE INSERTED", response.toString());
    } catch (e) {
      logMessage("INSERT ERROR", e.toString());
    }
  }

  @override
  Future<List<NoteEntity>?> fetchNotesFromDb(String? orderBy) async {
    try {
      final response = await _notesLocalDatasource.fetchNotesFromDb(orderBy);
      final List<NoteEntity> notes =
          response.map((note) => NoteEntity.fromMap(note.toMap())).toList();
      return notes;
    } catch (e) {
      logMessage("FETCH ERROR", e.toString());
      return null;
    }
  }

  @override
  Future<void> updateNoteInDb(NoteEntity newNote) async {
    try {
      final response = await _notesLocalDatasource.updateNoteInDb(
        NoteModel.fromMap(newNote.toMap()),
      );
      logMessage("NOTE UPDATED", response.toString());
    } catch (e) {
      logMessage("UPDATE ERROR", e.toString());
    }
  }

  @override
  Future<void> deleteNoteInDb(String noteId) async {
    try {
      final response = await _notesLocalDatasource.deleteNoteInDb(noteId);
      logMessage("NOTE DELETED", response.toString());
    } catch (e) {
      logMessage("NOTE DELETED", e.toString());
    }
  }
}
