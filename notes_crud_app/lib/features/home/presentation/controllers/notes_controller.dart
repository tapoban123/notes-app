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

  final RxList<NoteEntity> notes = <NoteEntity>[].obs;
  final isLoading = RxBool(false);
  final fetchingNotes = RxBool(false);

  void createNote(NoteEntity note) async {
    isLoading.value = true;
    await _insertNoteIntoDb.call(note);
    final List<NoteEntity> currentNotes = List.from(notes);
    currentNotes.add(note);
    notes.value = currentNotes;
    isLoading.value = false;
  }

  Future<void> deleteNote(String noteId) async {
    isLoading.value = true;
    await _deleteNoteInDb.call(noteId);
    final List<NoteEntity> currentNotes = List.from(notes);
    currentNotes.removeWhere((element) => element.noteId == noteId);

    notes.value = currentNotes;
    isLoading.value = false;
  }

  void fetchAllNotes() async {
    fetchingNotes.value = true;
    final fetchNotes = await _fetchAllNotesFromDb.call();
    notes.value = fetchNotes ?? [];
    fetchingNotes.value = false;
  }

  void updateNote(NoteEntity updatedNote) async {
    isLoading.value = true;
    await _updateNoteInDb.call(updatedNote);
    final List<NoteEntity> currentNotes = List.from(notes);
    final index = currentNotes.indexWhere(
      (element) => element.noteId == updatedNote.noteId,
    );
    currentNotes[index] = updatedNote;

    notes.value = currentNotes;
    isLoading.value = false;
  }
}
