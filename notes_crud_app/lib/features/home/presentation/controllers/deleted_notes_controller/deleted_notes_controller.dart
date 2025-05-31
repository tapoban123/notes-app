import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/add_to_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/delete_all_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/fetch_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/remove_from_deleted_notes.dart';

class DeletedNotesController extends GetxController {
  final AddToDeletedNotes _addToDeletedNotes;
  final FetchDeletedNotes _fetchDeletedNotes;
  final RemoveFromDeletedNotes _removeFromDeletedNotes;
  final DeleteAllDeletedNotes _deleteAllDeletedNotes;
  DeletedNotesController({
    required AddToDeletedNotes addToDeletedNotes,
    required FetchDeletedNotes fetchDeletedNotes,
    required RemoveFromDeletedNotes removeFromDeletedNotes,
    required DeleteAllDeletedNotes deleteAllDeletedNotes,
  }) : _addToDeletedNotes = addToDeletedNotes,
       _fetchDeletedNotes = fetchDeletedNotes,
       _removeFromDeletedNotes = removeFromDeletedNotes,
       _deleteAllDeletedNotes = deleteAllDeletedNotes;

  final deletedNotes = RxList<NoteEntity>([]);
  final fetchingDeletedNotes = RxBool(false);

  void addToDeletedNotes(NoteEntity deletedNote) async {
    final List<NoteEntity> currentList = deletedNotes;
    currentList.insert(0, deletedNote);
    _addToDeletedNotes.call(deletedNote);
    deletedNotes.value = currentList;
  }

  void fetchDeletedNotes() async {
    fetchingDeletedNotes.value = true;
    final List<NoteEntity> deletedNotesFromDB =
        await _fetchDeletedNotes.call() ?? [];
    deletedNotes.value = deletedNotesFromDB.reversed.toList();
    fetchingDeletedNotes.value = false;
  }

  void removeFromDeletedNotes(String noteId) async {
    final List<NoteEntity> currentList = deletedNotes;
    _removeFromDeletedNotes.call(noteId);
    deletedNotes.value = currentList;
  }

  void deleteAllDeletedNotes() async {
    _deleteAllDeletedNotes.call();
    deletedNotes.value = [];
  }
}
