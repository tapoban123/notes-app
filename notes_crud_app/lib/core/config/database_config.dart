import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum TableNames {
  notesTable("notes"),
  deletedNotesTable("deletedNotes");

  final String table;

  const TableNames(this.table);
}

class _SQLQueries {
  final String query;
  const _SQLQueries._(this.query);

  static String getCreateTableQuery(String tableName) =>
      """CREATE TABLE IF NOT EXISTS $tableName(
      noteId TEXT PRIMARY KEY, 
      title TEXT, 
      content TEXT, 
      createdAt INTEGER,
      updatedAt INTEGER)""";

  static String getDeleteTableQuery(String tableName) =>
      ("""DROP TABLE IF EXISTS $tableName""");
}

Future<Database> getDatabase() async {
  final sqliteDatabase = openDatabase(
    join(await getDatabasesPath(), "notes_database.db"),
    onCreate: (db, version) {
       db.execute(
        _SQLQueries.getCreateTableQuery(TableNames.notesTable.table),
      );
       db.execute(
        _SQLQueries.getCreateTableQuery(TableNames.deletedNotesTable.table),
      );
    },

    onOpen: (db) {
      // return db.execute(_SQLQueries.getDeleteTableQuery(TableNames.notesTable.table));
       db.execute(_SQLQueries.getCreateTableQuery(TableNames.notesTable.table));
       db.execute(_SQLQueries.getCreateTableQuery(TableNames.deletedNotesTable.table));
    },
    version: 1,
  );

  return sqliteDatabase;
}
