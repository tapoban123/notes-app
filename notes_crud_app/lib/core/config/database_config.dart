import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum TableNames {
  notesTable("notes");

  final String table;

  const TableNames(this.table);
}

Future<Database> getDatabase() async {
  final sqliteDatabase = openDatabase(
    join(await getDatabasesPath(), "notes_database.db"),
    onCreate: (db, version) {
      return db.execute("""
CREATE TABLE ${TableNames.notesTable.table}(
      note_id INTEGER PRIMARY KEY, 
      title TEXT, 
      content TEXT, 
      created_at INTEGER,
      updated_at INTEGER,
      )""");
    },
    version: 1,
  );

  return sqliteDatabase;
}
