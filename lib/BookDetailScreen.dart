import 'dart:ui';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class BookDetailScreen extends StatefulWidget {
  final String title;
  final String author;
  final String image;
  final String description;
  final int pages;
  final String language;

  const BookDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.pages,
    required this.language,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int submittedRating = 0; // ⭐ Holds the rating after review is submitted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔙 Back + Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF3C090E)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search all books...',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🟤 Divider After Search
            Container(height: 2, width: double.infinity, color: const Color(0xFF3C090E)),
            const SizedBox(height: 12),

            // 📕 Book Image + Title + Author with Blurred Background
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Image.asset(
                            widget.image,
                            width: 550,
                            height: 260,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.image,
                          width: 150,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3C090E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.author,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3C090E),
                    ),
                  ),
                ],
              ),
            ),

            // 🟤 Divider After Author
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(height: 2, width: 390, color: Color(0xFF3C090E)),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // 📚 Book Info Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.menu_book_rounded, color: Color(0xFF3C090E)),
                      const SizedBox(height: 4),
                      Text('${widget.pages}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Text("Pages"),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < submittedRating ? Icons.star : Icons.star_border,
                            size: 18,
                            color: const Color(0xFF3C090E),
                          );
                        }),
                      ),
                      const SizedBox(height: 4),
                      const Text("My Rating"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.language, color: Color(0xFF3C090E)),
                      const SizedBox(height: 4),
                      Text(widget.language, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Text("Language"),
                    ],
                  ),
                ],
              ),
            ),

            // 🟤 Divider After Book Info
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(height: 2, width: 390, color: Color(0xFF3C090E)),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // 📝 Write a Review
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3C090E),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      int selectedRating = submittedRating;
                      TextEditingController reviewController = TextEditingController();
                      final String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

                      return StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return AlertDialog(
                            backgroundColor: const Color(0xFFFAF3F3),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              "Write a Review",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3C090E)),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (index) {
                                    return IconButton(
                                      icon: Icon(
                                        index < selectedRating ? Icons.star : Icons.star_border,
                                        color: const Color(0xFF3C090E),
                                      ),
                                      onPressed: () {
                                        setStateDialog(() => selectedRating = index + 1);
                                      },
                                    );
                                  }),
                                ),
                                const SizedBox(height: 12),
                                TextField(
                                  controller: reviewController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your review...',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text("Date: $currentDate", style: const TextStyle(color: Colors.black54)),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel", style: TextStyle(color: Colors.red)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    submittedRating = selectedRating;
                                  });
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3C090E),
                                ),
                                child: const Text("Submit", style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                child: const Text("Write a Review", style: TextStyle(color: Colors.white)),
              ),
            ),

            // 🟤 Divider After Review Button
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(height: 2, width: 390, color: Color(0xFF3C090E)),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // 📖 Book Description Label
            const Center(
              child: Text(
                "Book Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C090E),
                ),
              ),
            ),

            // 🟤 Divider Below Label
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(height: 4, width: 180, color: Color(0xFF3C090E)),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            // 📚 Description Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔽 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3C090E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookHomeScreen()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/books.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/stack.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/journal.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/weather.png')), label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/icons/profile.png')), label: ''),
        ],
      ),
    );
  }
}
