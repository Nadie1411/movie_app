abstract class BookmarkEvent {}

class CheckBookmarkStatus extends BookmarkEvent {
  final String movieId;
  CheckBookmarkStatus(this.movieId);
}

class AddBookmark extends BookmarkEvent {
  final String movieId;
  AddBookmark(this.movieId);
}

class RemoveBookmark extends BookmarkEvent {
  final String movieId;
  RemoveBookmark(this.movieId);
}

abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkStatus extends BookmarkState {
  final bool isBookmarked;
  BookmarkStatus(this.isBookmarked);
}
