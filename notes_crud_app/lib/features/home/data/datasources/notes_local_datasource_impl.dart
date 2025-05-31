import 'package:notes_crud_app/core/config/database_config.dart';
import 'package:notes_crud_app/features/home/data/datasources/notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesLocalDatasourceImpl extends NotesLocalDatasource {
  late Database _sqfliteDb;

  Future<void> _initDb() async {
    _sqfliteDb = await getDatabase();
  }

  @override
  Future<List<NoteModel>> fetchNotesFromDb(String? orderBy) async {
    await _initDb();
    final response = await _sqfliteDb.query(
      TableNames.notesTable.table,
      orderBy: orderBy,
    );
    final List<NoteModel> notes =
        response.map((note) => NoteModel.fromMap(note)).toList();
    print(notes);

    return notes;
  }

  @override
  Future<int> insertNoteIntoDb(NoteModel note) async {
    await _initDb();

    final newNote = note.toMap();
    newNote.remove("updatedAt");

    final response = await _sqfliteDb.insert(
      TableNames.notesTable.table,
      newNote,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return response;
  }

  @override
  Future<int> updateNoteInDb(NoteModel newNote) async {
    await _initDb();

    final response = await _sqfliteDb.update(
      TableNames.notesTable.table,
      where: "noteId = ?",
      whereArgs: [newNote.noteId],
      newNote.toMap(),
    );

    return response;
  }

  @override
  Future<int> deleteNoteInDb(String noteId) async {
    await _initDb();

    final response = await _sqfliteDb.delete(
      TableNames.notesTable.table,
      where: "noteId = ?",
      whereArgs: [noteId],
    );

    return response;
  }
}
