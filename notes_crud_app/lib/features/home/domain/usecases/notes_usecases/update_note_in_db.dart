import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';

class UpdateNoteInDb {
  final NotesRepository _notesRepository;

  UpdateNoteInDb({required NotesRepository notesRepository})
    : _notesRepository = notesRepository;

  Future<void> call(NoteEntity newNote) async {
    _notesRepository.updateNoteInDb(newNote);
  }
}
