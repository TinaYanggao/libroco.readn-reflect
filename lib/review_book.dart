class ReviewedBook {
  final String title;
  final String author;
  final String image;
  final int pages;
  final String language;
  final String description;
  final String review;
  final int rating;
  final DateTime date; // ✅ Added date field

  ReviewedBook({
    required this.title,
    required this.author,
    required this.image,
    required this.pages,
    required this.language,
    required this.description,
    required this.review,
    required this.rating,
    required this.date, // ✅ Constructor match
  });
}

List<ReviewedBook> reviewedBooks = [];
