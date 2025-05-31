import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/usecases/notes_usecases/delete_note_in_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/notes_usecases/fetch_all_notes_from_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/notes_usecases/insert_note_into_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/notes_usecases/update_note_in_db.dart';

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
  final fetchingNotes = RxBool(false);

  void createNote(NoteEntity note) async {
    _insertNoteIntoDb.call(note);
    final List<NoteEntity> currentNotes = List.from(notes);
    currentNotes.insert(0, note);
    notes.value = currentNotes;
  }

  Future<void> deleteNote(String noteId) async {
    _deleteNoteInDb.call(noteId);
    final List<NoteEntity> currentNotes = List.from(notes);
    currentNotes.removeWhere((element) => element.noteId == noteId);

    notes.value = currentNotes;
  }

  void fetchAllNotes(String? orderBy) async {
    fetchingNotes.value = true;
    final fetchNotes = await _fetchAllNotesFromDb.call(orderBy);
    if (orderBy == null) {
      notes.value = (fetchNotes ?? []).reversed.toList();
    } else {
      notes.value = fetchNotes ?? [];
    }
    fetchingNotes.value = false;
  }

  void updateNote(NoteEntity updatedNote) async {
    _updateNoteInDb.call(updatedNote);
    final List<NoteEntity> currentNotes = List.from(notes);
    final index = currentNotes.indexWhere(
      (element) => element.noteId == updatedNote.noteId,
    );
    currentNotes[index] = updatedNote;

    notes.value = currentNotes;
  }
}
