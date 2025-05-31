import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class FetchDeletedNotes {
  final DeletedNotesRepository _deletedNotesRepository;
  FetchDeletedNotes({required DeletedNotesRepository deletedNotesRepository})
    : _deletedNotesRepository = deletedNotesRepository;

  Future<List<NoteEntity>?> call() async {
    return await _deletedNotesRepository.fetchAllNotes();
  }
}
