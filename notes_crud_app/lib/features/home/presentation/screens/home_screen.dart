import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/utils/utils.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/notes_controller.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/note_tile.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/notes_search_delegate.dart';
import 'package:notes_crud_app/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotesController notesController;

  @override
  void initState() {
    notesController = Get.find();
    notesController.fetchAllNotes(null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: NotesSearchDelegate(allNotes: notesController.notes),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.editOrAddScreen.route);
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        if (notesController.fetchingNotes.value) {
          return showProgressIndicator();
        }
        if (notesController.notes.isEmpty) {
          return Center(
            child: Text(
              "You do not have any notes.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              _SortOptions(notesController: notesController),
              Expanded(
                child: ListView.builder(
                  itemCount: notesController.notes.length,
                  itemBuilder: (context, index) {
                    final note = notesController.notes[index];

                    return Dismissible(
                      key: Key(note.noteId),
                      background: SizedBox(),
                      direction: DismissDirection.endToStart,
                      secondaryBackground: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),

                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) => showConfirmDeleteDialog(),
                        );
                      },
                      onDismissed: (direction) async {
                        await notesController.deleteNote(note.noteId);

                        if (context.mounted) {
                          showSnackBar(
                            context,
                            message: "Your note has been deleted.",
                          );
                        }
                      },
                      child: NoteTile(noteData: note),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget showConfirmDeleteDialog() {
    return AlertDialog(
      title: Text("Delete Note"),
      content: Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back(result: true);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class _SortOptions extends StatefulWidget {
  final NotesController notesController;
  const _SortOptions({required this.notesController});

  @override
  State<_SortOptions> createState() => _SortOptionsState();
}

class _SortOptionsState extends State<_SortOptions> {
  final ValueNotifier<int?> selectedOption = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: ValueListenableBuilder(
        valueListenable: selectedOption,
        builder:
            (context, selectedOptionValue, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                sortButton(
                  index: 0,
                  buttonName: "Title",
                  selectedIndex: selectedOptionValue,
                  onTap: () {
                    selectedOption.value = 0;
                    widget.notesController.fetchAllNotes("title");
                  },
                ),
                sortButton(
                  index: 1,
                  buttonName: "Creation Time",
                  selectedIndex: selectedOptionValue,
                  onTap: () {
                    selectedOption.value = 1;

                    widget.notesController.fetchAllNotes("createdAt");
                  },
                ),
                sortButton(
                  index: 2,
                  buttonName: "Reset",
                  selectedIndex: selectedOptionValue,
                  color: Colors.white60,
                  icon: Icons.restore,
                  onTap: () {
                    selectedOption.value = null;

                    widget.notesController.fetchAllNotes(null);
                  },
                ),
              ],
            ),
      ),
    );
  }

  Widget sortButton({
    required int index,
    required String buttonName,
    int? selectedIndex,
    IconData icon = Icons.sort,
    Color? color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            buttonName,
            style: TextStyle(
              color:
                  color ??
                  (selectedIndex == index ? Colors.white : Colors.white54),
            ),
          ),
          SizedBox(width: 5),
          Icon(
            icon,
            color:
                color ??
                (selectedIndex == index ? Colors.white : Colors.white54),
          ),
        ],
      ),
    );
  }
}
