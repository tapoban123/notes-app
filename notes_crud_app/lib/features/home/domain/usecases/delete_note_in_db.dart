import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';

class DeleteNoteInDb {
  final NotesRepository _notesRepository;

  DeleteNoteInDb({required NotesRepository notesRepository})
    : _notesRepository = notesRepository;

  Future<void> call(String noteId) async {
    await _notesRepository.deleteNoteInDb(noteId);
  }
}
