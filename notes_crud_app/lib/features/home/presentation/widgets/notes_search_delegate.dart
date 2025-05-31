import 'package:flutter/material.dart';
import 'package:notes_crud_app/features/home/domain/entities/note_entity.dart';
import 'package:notes_crud_app/features/home/presentation/widgets/note_tile.dart';

class NotesSearchDelegate extends SearchDelegate {
  final List<NoteEntity> allNotes;
  NotesSearchDelegate({required this.allNotes});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<NoteEntity> matchedQuery = [];

    for (var note in allNotes) {
      if (note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.content.toLowerCase().contains(query.toLowerCase())) {
        matchedQuery.add(note);
      }
    }

    return ListView.builder(
      itemCount: matchedQuery.length,
      itemBuilder: (context, index) {
        return NoteTile(noteData: matchedQuery[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<NoteEntity> matchedNotes = [];

    for (final note in allNotes) {
      if (note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.content.toLowerCase().contains(query.toLowerCase())) {
        matchedNotes.add(note);
      }
    }

    return ListView.builder(
      itemCount: matchedNotes.length,
      itemBuilder: (context, index) {
        return NoteTile(noteData: matchedNotes[index]);
      },
    );
  }
}
