import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';

class InsertNoteIntoDb {
  final NotesRepository _notesRepository;

  InsertNoteIntoDb({required NotesRepository notesRepository})
    : _notesRepository = notesRepository;
  
  Future<void> call(NoteEntity note) async {
    await _notesRepository.insertNoteIntoDb(note);
  }
}
