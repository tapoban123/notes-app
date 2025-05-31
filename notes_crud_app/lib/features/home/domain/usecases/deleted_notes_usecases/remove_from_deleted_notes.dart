import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class RemoveFromDeletedNotes {
  final DeletedNotesRepository _deletedNotesRepository;
  const RemoveFromDeletedNotes({
    required DeletedNotesRepository deletedNotesRepository,
  }) : _deletedNotesRepository = deletedNotesRepository;

  Future<void> call(String noteId)async{
    _deletedNotesRepository.removeNote(noteId);
  }
}
