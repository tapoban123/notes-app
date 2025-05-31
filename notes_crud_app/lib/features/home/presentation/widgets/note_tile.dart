import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/routes.dart';

class NoteTile extends StatelessWidget {
  final NoteEntity noteData;
  const NoteTile({super.key, required this.noteData});

  @override
  Widget build(BuildContext context) {
    final dateTimeStyle = TextStyle(
      fontSize: 11,
      color: Colors.white.withValues(alpha: 0.5),
    );

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0).copyWith(top: 0, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 220,
              child: Text(
                noteData.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _NoteTileButton(
              icon: Icons.edit,
              iconColor: Colors.blue,
              onTap: () {
                Get.toNamed(
                  RouteNames.editOrAddScreen.route,
                  arguments: {"isEditNote": true, "noteData": noteData},
                );
              },
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteData.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(
                    DateTime.fromMillisecondsSinceEpoch(noteData.createdAt),
                  ),
                  style: dateTimeStyle,
                ),
                Text(
                  formatTime(
                    DateTime.fromMillisecondsSinceEpoch(noteData.createdAt),
                  ),
                  style: dateTimeStyle,
                ),
              ],
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
