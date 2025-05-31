import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/data/datasources/deleted_notes_local_datasource.dart';
import 'package:notes_crud_app/features/home/data/datasources/deleted_notes_local_datasource_impl/deleted_notes_local_datasource_impl.dart';
import 'package:notes_crud_app/features/home/data/repository/deleted_notes_repository_impl.dart';
import 'package:notes_crud_app/features/home/domain/repository/deleted_notes_repository.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/add_to_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/delete_all_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/fetch_deleted_notes.dart';
import 'package:notes_crud_app/features/home/domain/usecases/deleted_notes_usecases/remove_from_deleted_notes.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/deleted_notes_controller/deleted_notes_controller.dart';

class DeletedNotesBinding extends Bindings {
  @override
  void dependencies() {
    // datasource
    Get.lazyPut<DeletedNotesLocalDatasource>(
      () => DeletedNotesLocalDatasourceImpl(),
    );

    // repository
    Get.lazyPut<DeletedNotesRepository>(
      () => DeletedNotesRepositoryImpl(deletedNotesLocalDatasource: Get.find()),
    );

    // usecases
    Get.lazyPut(() => AddToDeletedNotes(deletedNotesRepository: Get.find()));
    Get.lazyPut(() => FetchDeletedNotes(deletedNotesRepository: Get.find()));
    Get.lazyPut(
      () => RemoveFromDeletedNotes(deletedNotesRepository: Get.find()),
    );
    Get.lazyPut(
      () => DeleteAllDeletedNotes(deletedNotesRepository: Get.find()),
    );

    // controller
    Get.put(
      DeletedNotesController(
        addToDeletedNotes: Get.find(),
        fetchDeletedNotes: Get.find(),
        removeFromDeletedNotes: Get.find(),
        deleteAllDeletedNotes: Get.find(),
      ),
    );
  }
}
