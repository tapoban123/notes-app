import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';

class NotesController extends GetxController {
  final RxList<NoteEntity> notes = RxList([]);
  final isLoading = RxBool(false);

  void createNote(NoteEntity note){
    
  }
}
