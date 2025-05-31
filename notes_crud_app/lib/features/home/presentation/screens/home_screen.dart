import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/note_tile.dart';
import 'package:notes_crud_app/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesController notesController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("Notes"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.editOrAddScreen.route);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (notesController.isLoading.value) {
          showProgressIndicator();
        }
        if (notesController.notes.isEmpty) {
          return Text("You do not have any notes.");
        }
        return ListView.builder(
          itemCount: notesController.notes.length,
          itemBuilder: (context, index) {
            final note = notesController.notes[index];

            return NoteTile(noteData: note);
          },
        );
      }),
    );
  }
}
