import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.editOrAddScreen.route);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Hello World"),
            trailing: IconButton(
              onPressed: () {
                Get.toNamed(
                  RouteNames.editOrAddScreen.route,
                  arguments: {
                    "isEditNote": true,
                    "noteData": NoteEntity(
                      noteId: "123",
                      title: "HEllo World",
                      content: "Code a lot",
                      createdAt: 2,
                      updatedAt: 2,
                    ),
                  },
                );
              },
              icon: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
