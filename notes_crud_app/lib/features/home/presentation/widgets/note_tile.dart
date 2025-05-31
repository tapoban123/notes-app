import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/routes.dart';

class NoteTile extends StatelessWidget {
  final NoteEntity noteData;
  const NoteTile({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 220,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                _NoteTileButton(
                  icon: Icons.edit,
                  iconColor: Colors.blue,
                  onTap: () {
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
                ),
                _NoteTileButton(
                  icon: Icons.delete,
                  iconColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        subtitle: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis tempor egestas. Duis et sapien eget velit ultricies maximus eu varius risus. Proin suscipit placerat diam, eleifend blandit velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tristique ultricies ante, sed egestas ex molestie id. Fusce congue convallis ante ut volutpat. Nulla congue lectus nec feugiat blandit. Cras pellentesque lorem sem, a viverra sapien auctor et. Aenean aliquet posuere neque et ullamcorper. Nullam rutrum, lorem sed iaculis finibus, ipsum ante vehicula purus, nec molestie dolor purus at lorem. Integer consequat bibendum metus non placerat. Nulla ut lacinia enim. Vivamus ullamcorper lorem eros, commodo porta velit porta et. Duis condimentum nec ligula in blandit. Sed eu faucibus turpis, at maximus leo. Duis pulvinar tristique erat eget pretium",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _NoteTileButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;
  const _NoteTileButton({
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
      icon: Icon(icon, color: iconColor),
    );
  }
}
