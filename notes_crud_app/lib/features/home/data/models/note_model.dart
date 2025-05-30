// ignore_for_file: public_member_api_docs, sort_constructors_first

class NoteModel {
  final String noteId;
  final String title;
  final String content;
  final int createdAt;
  final int? updatedAt;

  const NoteModel({
    required this.noteId,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });

  NoteModel copyWith({
    String? noteId,
    String? title,
    String? content,
    int? createdAt,
    int? updatedAt,
  }) {
    return NoteModel(
      noteId: noteId ?? this.noteId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteId': noteId,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      noteId: map['noteId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as int : null,
    );
  }

  @override
  String toString() {
    return 'NoteModel(noteId: $noteId, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant NoteModel other) {
    if (identical(this, other)) return true;

    return other.noteId == noteId &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return noteId.hashCode ^
        title.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
