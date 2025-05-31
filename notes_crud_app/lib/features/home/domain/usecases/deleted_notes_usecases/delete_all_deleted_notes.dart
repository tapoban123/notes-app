import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class DeleteAllDeletedNotes {
  final DeletedNotesRepository _deletedNotesRepository;
  DeleteAllDeletedNotes({
    required DeletedNotesRepository deletedNotesRepository,
  }) : _deletedNotesRepository = deletedNotesRepository;

  Future<void> call() async {
    _deletedNotesRepository.deleteAllDeletedNotes();
  }
}
