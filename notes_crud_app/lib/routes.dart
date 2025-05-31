import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/deleted_notes_controller/deleted_notes_binding.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller/notes_binding.dart';
import 'package:notes_crud_app/features/home/presentation/screens/add_or_edit_note_screen.dart';
import 'package:notes_crud_app/features/home/presentation/screens/deleted_notes_screen.dart';
import 'package:notes_crud_app/features/home/presentation/screens/home_screen.dart';

enum RouteNames {
  home(route: "/"),
  editOrAddScreen(route: "/addOrEdit"),
  deletedNotesScreen(route: "/deletedNotes");

  final String route;

  const RouteNames({required this.route});
}

final routes = [
  GetPage(
    name: RouteNames.home.route,
    page: () => HomeScreen(),
    bindings: [NotesBinding(), DeletedNotesBinding()],
  ),
  GetPage(
    name: RouteNames.editOrAddScreen.route,
    page: () => AddOrEditNoteScreen(),
    binding: NotesBinding(),
  ),
  GetPage(
    name: RouteNames.deletedNotesScreen.route,
    page: () => DeletedNotesScreen(),
    bindings: [NotesBinding(), DeletedNotesBinding()],
  ),
];
