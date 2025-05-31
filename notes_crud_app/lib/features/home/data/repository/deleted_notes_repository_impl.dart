import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/data/datasources/deleted_notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/models/note_model.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class DeletedNotesRepositoryImpl extends DeletedNotesRepository {
  final DeletedNotesLocalDatasource _deletedNotesLocalDatasource;
  DeletedNotesRepositoryImpl({
    required DeletedNotesLocalDatasource deletedNotesLocalDatasource,
  }) : _deletedNotesLocalDatasource = deletedNotesLocalDatasource;

  @override
  Future<void> addNewNote(NoteEntity note) async {
    try {
      final response = await _deletedNotesLocalDatasource.addNewNote(
        NoteModel.fromMap(note.toMap()),
      );
      logMessage("DELETED NOTE ADDED", response.toString());
    } catch (e) {
      logMessage("DELETE INSERT ERROR", e.toString());
    }
  }

  @override
  Future<List<NoteEntity>?> fetchAllNotes() async {
    try {
      final response = await _deletedNotesLocalDatasource.fetchAllNotes();
      final List<NoteEntity> deletedNotes =
          response!.map((e) => NoteEntity.fromMap(e.toMap())).toList();
      return deletedNotes;
    } catch (e) {
      logMessage("FETCH DELTED NOTES ERROR", e.toString());
      return null;
    }
  }

  @override
  Future<void> removeNote(String noteId) async {
    try {
      final response = await _deletedNotesLocalDatasource.removeNote(noteId);
      logMessage("NOTE RESTORED", response.toString());
    } catch (e) {
      logMessage("NOTE RESTORATION ERROR", e.toString());
    }
  }

  @override
  Future<void> deleteAllDeletedNotes() async {
    try {
      final response = _deletedNotesLocalDatasource.deleteAllDeletedNotes();
      logMessage("DELETED ALL DELETED NOTES", response.toString());
    } catch (e) {
      logMessage("DELETED NOTES DELETION ERROR", e.toString());
    }
  }
}
