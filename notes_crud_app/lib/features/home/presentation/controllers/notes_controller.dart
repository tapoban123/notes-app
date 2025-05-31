import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/usecases/delete_note_in_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/fetch_all_notes_from_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/insert_note_into_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/update_note_in_db.dart';

class NotesController extends GetxController {
  final InsertNoteIntoDb _insertNoteIntoDb;
  final FetchAllNotesFromDb _fetchAllNotesFromDb;
  final UpdateNoteInDb _updateNoteInDb;
  final DeleteNoteInDb _deleteNoteInDb;

  NotesController({
    required InsertNoteIntoDb insertNoteIntoDb,
    required FetchAllNotesFromDb fetchAllNotesFromDb,
    required UpdateNoteInDb updateNoteInDb,
    required DeleteNoteInDb deleteNoteInDb,
  }) : _insertNoteIntoDb = insertNoteIntoDb,
       _fetchAllNotesFromDb = fetchAllNotesFromDb,
       _updateNoteInDb = updateNoteInDb,
       _deleteNoteInDb = deleteNoteInDb;

  final RxList<NoteEntity> notes = RxList([]);
  final isLoading = RxBool(false);
  final fetchingNotes = RxBool(false);

  void createNote(NoteEntity note) async {
    isLoading.value = true;
    await _insertNoteIntoDb.call(note);
    notes.add(note);
    isLoading.value = false;
  }

  void deleteNote(String noteId) async {
    isLoading.value = true;
    await _deleteNoteInDb.call(noteId);
    notes.removeWhere((element) => element.noteId == noteId);
    isLoading.value = false;
  }

  void fetchAllNotes() async {
    fetchingNotes.value = true;
    final fetchNotes = await _fetchAllNotesFromDb.call();
    notes.value = fetchNotes ?? [];
    print(notes);
    fetchingNotes.value = false;
  }

  void updateNote(NoteEntity newNote) async {
    isLoading.value = true;
    await _updateNoteInDb.call(newNote);
    isLoading.value = false;
  }
}
