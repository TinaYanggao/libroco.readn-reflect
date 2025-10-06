class SavedBook {
  final String title;
  final String author;
  final String image;
  final String description;
  final int pages;
  final String language;

  SavedBook({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.pages,
    required this.language,
  });
}

// ✅ Global list of saved books
List<SavedBook> savedBooks = [];
