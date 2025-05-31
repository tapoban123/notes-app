import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/data/datasources/deleted_notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/models/note_model.dart';
import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class DeletedNotesRepositoryImpl extends DeletedNotesRepository {
  final DeletedNotesLocalDatasource _deletedNotesLocalDatasource;
  DeletedNotesRepositoryImpl({
    required DeletedNotesLocalDatasource deletedNotesLocalDatasource,
  }) : _deletedNotesLocalDatasource = deletedNotesLocalDatasource;

  @override
  Future<void> addNewNote(NoteModel note) async {
    try {
      final response = await _deletedNotesLocalDatasource.addNewNote(note);
      logMessage("DELETED NOTE ADDED", response.toString());
    } catch (e) {
      logMessage("DELETE INSERT ERROR", e.toString());
    }
  }

  @override
  Future<List<NoteModel>?> fetchAllNotes() async {
    try {
      final deletedNotes = await _deletedNotesLocalDatasource.fetchAllNotes();
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
}
