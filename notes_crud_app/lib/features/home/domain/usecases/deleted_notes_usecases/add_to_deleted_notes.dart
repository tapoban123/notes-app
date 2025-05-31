import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';

class AddToDeletedNotes {
  final DeletedNotesRepository _deletedNotesRepository;
  AddToDeletedNotes({required DeletedNotesRepository deletedNotesRepository})
    : _deletedNotesRepository = deletedNotesRepository;

Future<void> call(NoteEntity note)async{
  _deletedNotesRepository.addNewNote(note);
}
}
