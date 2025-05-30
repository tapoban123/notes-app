import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';

class FetchAllNotesFromDb {
  final NotesRepository _notesRepository;

  FetchAllNotesFromDb({required NotesRepository notesRepository})
    : _notesRepository = notesRepository;

  Future<List<NoteEntity>?> call() async {
    return await _notesRepository.fetchNotesFromDb();
  }
}
