class NoteEntity {
  final String noteId;
  final String title;
  final String content;
  final int createdAt;
  final int? updatedAt;

  const NoteEntity({
    required this.noteId,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });
}
