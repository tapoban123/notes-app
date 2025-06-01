# Coding Junior Internship Assignment

Build a Flutter app for creating, editing, searching, and deleting personal notes. Use GetX for state management, dependency injection, and routing. The app should persist notes locally via SQLite and provide a smooth user experience with reactive UI updates.

## [Source Code](notes_crud_app)

## [Screen Recording](https://drive.google.com/file/d/1OxaGkptvMYXk0j1wUvY5GghCJKkeZcPA/view?usp=sharing)

## [.apk Files](apk_files)

## Tech Stack used:

- `Getx`
- `sqflite`
- `Clean Architecture`

### Requirements:

- Use Flutter + Dart with GetX for state management and navigation
- Notes have title, content, createdAt, updatedAt
- Home screen: searchable, sortable list of notes (sort by date/title)
- Add/Edit note screen with form validation (non-empty title/content)
- Swipe to delete notes with confirmation dialog
- Persist data locally using SQLite (`sqflite`) accessed via a GetX service class
- Use GetX Controllers and reactive observables (`RxList`, `RxString`) for UI updates
- Implement navigation with GetX named routes and bindings
- Include offline-first behavior: all data from local DB, no cloud
- No use of AI-generated boilerplate or code snippets—write your own state and DB logic

### Bonus:

- Dark mode toggle using GetX theme management
- Undo delete with Snackbar and Restore action
- Responsive UI for phones and tablets
