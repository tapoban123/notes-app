import 'package:notes_crud_app/core/config/database_config.dart';
import 'package:notes_crud_app/features/home/data/datasources/deleted_notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class DeletedNotesLocalDatasourceImpl extends DeletedNotesLocalDatasource {
  late Database _notesDb;

  Future<void> _initDb() async {
    _notesDb = await getDatabase();
  }

  @override
  Future<int> addNewNote(NoteModel note) async {
    await _initDb();
    final response = await _notesDb.insert(
      TableNames.deletedNotesTable.table,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  @override
  Future<List<NoteModel>?> fetchAllNotes() async {
    await _initDb();
    final response = await _notesDb.query(TableNames.deletedNotesTable.table);
    final List<NoteModel> deletedNotes =
        response.map((e) => NoteModel.fromMap(e)).toList();
    return deletedNotes;
  }

  @override
  Future<int> removeNote(String noteId) async {
    await _initDb();
    final response = await _notesDb.delete(
      TableNames.deletedNotesTable.table,
      where: "noteId = ?",
      whereArgs: [noteId],
    );

    return response;
  }

  @override
  Future<int> deleteAllDeletedNotes() async {
    await _initDb();
    final response = await _notesDb.delete(TableNames.deletedNotesTable.table);
    return response;
  }
}
