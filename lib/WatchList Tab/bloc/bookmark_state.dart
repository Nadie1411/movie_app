abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkStatus extends BookmarkState {
  final bool isBookmarked;

  BookmarkStatus(this.isBookmarked);
}
