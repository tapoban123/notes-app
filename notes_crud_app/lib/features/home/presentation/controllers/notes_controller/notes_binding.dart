import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/data/datasources/notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/datasources/notes_local_datasource_impl/notes_local_datasource_impl.dart';
import 'package:notes_crud_app/features/home/data/repository/notes_repository_impl.dart';
import 'package:notes_crud_app/features/home/domain/repository/notes_repository.dart';
import 'package:notes_crud_app/features/home/domain/usecases/delete_note_in_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/fetch_all_notes_from_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/insert_note_into_db.dart';
import 'package:notes_crud_app/features/home/domain/usecases/update_note_in_db.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller/notes_controller.dart';

class NotesBinding extends Bindings {
  @override
  void dependencies() {
    // datasource
    Get.lazyPut<NotesLocalDatasource>(() => NotesLocalDatasourceImpl());

    // repository
    Get.lazyPut<NotesRepository>(() => NotesRepositoryImpl(notesLocalDatasource: Get.find()));

    // usecases
    Get.lazyPut(() => InsertNoteIntoDb(notesRepository: Get.find()));
    Get.lazyPut(() => FetchAllNotesFromDb(notesRepository: Get.find()));
    Get.lazyPut(() => UpdateNoteInDb(notesRepository: Get.find()));
    Get.lazyPut(() => DeleteNoteInDb(notesRepository: Get.find()));

    // controller
    Get.put(
      NotesController(
        insertNoteIntoDb: Get.find(),
        fetchAllNotesFromDb: Get.find(),
        updateNoteInDb: Get.find(),
        deleteNoteInDb: Get.find(),
      ),
    );
  }
}
