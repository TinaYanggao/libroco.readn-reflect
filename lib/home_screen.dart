import 'package:flutter/material.dart';
import 'stack_screen.dart';

import 'journal_screen.dart';
import 'weather_screen.dart';
import 'profile_screen.dart';

import 'BookDetailScreen.dart'; // import your detail screen

class BookHomeScreen extends StatefulWidget {
  const BookHomeScreen({super.key});

  @override
  State<BookHomeScreen> createState() => _BookHomeScreenState();
}

class _BookHomeScreenState extends State<BookHomeScreen> {
  int selectIndex = 0;

  // Track if a book is selected (for showing detail page)
  Map<String, dynamic>? selectedBook;

  // List of main pages (without Book Detail)
  final List<Widget> pages = [
    const BooksPageContent(),
    const StackScreen(),
    const JournalScreen(),
    const WeatherScreen(),
    const ProfileScreen(),
  ];

  // When a book is tapped, call this to show detail
  void onBookTap(Map<String, dynamic> book) {
    setState(() {
      selectedBook = book;
    });
  }

  // When back is pressed from BookDetailScreen
  void onBackFromDetail() {
    setState(() {
      selectedBook = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: selectedBook != null
          ? BookDetailScreen(
        title: selectedBook!['title']!,
        author: getAuthorForBook(selectedBook!['title']!),
        image: selectedBook!['image']!,
        pages: getPagesForBook(selectedBook!['title']!),
        language: "English",
        description: getDescriptionForBook(selectedBook!['title']!),
        onBack: onBackFromDetail,
      )
          : IndexedStack(
        index: selectIndex,
        children: pages.map((page) {
          // Inject onBookTap only for BooksPageContent
          if (page is BooksPageContent) {
            return BooksPageContent(onBookTap: onBookTap);
          }
          return page;
        }).toList(),
      ),
      bottomNavigationBar: selectedBook == null
          ? BottomNavigationBar(
        currentIndex: selectIndex,
        backgroundColor: const Color(0xFF3C090E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/books.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/stack.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/journal.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/weather.png')),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/profile.png')),
              label: ''),
        ],
      )
          : null, // hide navbar on detail page
    );
  }
}

// Updated BooksPageContent to accept onBookTap callback
class BooksPageContent extends StatelessWidget {
  final Function(Map<String, dynamic>)? onBookTap;

  const BooksPageContent({super.key, this.onBookTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟠 Circular Logo and Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF918D8C),
                    border:
                    Border.all(color: const Color(0xFF918D8C), width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'READN’REFLECT',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 2, width: 550, color: const Color(0xFF3C090E)),
          const SizedBox(height: 12),

          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search all books...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(height: 2, width: 550, color: const Color(0xFF3C090E)),
          const SizedBox(height: 8),

          // 📚 Book Sections
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCategorySection('Romance', [
                    {
                      'image': 'assets/Books/LukovL.png',
                      'title': 'From Lukov With Love'
                    },
                    {
                      'image': 'assets/Books/eleanornpark.png',
                      'title': 'Eleanor & Park'
                    },
                    {
                      'image': 'assets/Books/prideandprejudice.png',
                      'title': 'Pride and Prejudice'
                    },
                  ]),
                  separatorLine(),
                  buildCategorySection('Fantasy', [
                    {
                      'image': 'assets/Books/gildedwolves.png',
                      'title': 'The Gilded Wolves'
                    },
                    {
                      'image': 'assets/Books/jadecity.png',
                      'title': 'Jade City'
                    },
                    {
                      'image': 'assets/Books/achilles.png',
                      'title': 'The Song of Achilles'
                    },
                  ]),
                  separatorLine(),
                  buildCategorySection('Mystery', [
                    {
                      'image': 'assets/Books/silentpatient.png',
                      'title': 'The Silent Patient'
                    },
                    {
                      'image': 'assets/Books/thursdaymurder.png',
                      'title': 'The Thursday Murder Club'
                    },
                    {
                      'image': 'assets/Books/openeyes.png',
                      'title': 'Don’t Open Your Eyes'
                    },
                  ]),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection(String title, List<Map<String, String>> books) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C090E),
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFF3C090E),
                decorationThickness: 3.5,
                height: 2.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              separatorBuilder: (_, __) => const SizedBox(width: 35),
              itemBuilder: (context, index) {
                final book = books[index];
                return InkWell(
                  onTap: () {
                    if (onBookTap != null) {
                      onBookTap!(book);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          book['image']!,
                          width: 120,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 120,
                        child: Text(
                          book['title']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3C090E),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget separatorLine() {
    return Center(
      child: Column(
        children: [
          Container(height: 2, width: 300, color: const Color(0xFF3C090E)),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// Helper functions for book data
String getAuthorForBook(String title) {
  switch (title) {
    case 'Pride and Prejudice':
      return 'Jane Austen';
    case 'Eleanor & Park':
      return 'Rainbow Rowell';
    case 'From Lukov With Love':
      return 'Mariana Zapata';
    case 'The Gilded Wolves':
      return 'Roshani Chokshi';
    case 'Jade City':
      return 'Fonda Lee';
    case 'The Song of Achilles':
      return 'Madeline Miller';
    case 'The Silent Patient':
      return 'Alex Michaelides';
    case 'The Thursday Murder Club':
      return 'Richard Osman';
    case 'Don’t Open Your Eyes':
      return 'Avery Bishop';
    default:
      return 'Unknown Author';
  }
}

int getPagesForBook(String title) {
  switch (title) {
    case 'Pride and Prejudice':
      return 488;
    case 'Eleanor & Park':
      return 325;
    case 'From Lukov With Love':
      return 540;
    case 'The Gilded Wolves':
      return 400;
    case 'Jade City':
      return 560;
    case 'The Song of Achilles':
      return 416;
    case 'The Silent Patient':
      return 336;
    case 'The Thursday Murder Club':
      return 368;
    case 'Don’t Open Your Eyes':
      return 350;
    default:
      return 300;
  }
}

String getDescriptionForBook(String title) {
  switch (title) {
    case 'Pride and Prejudice':
      return "A timeless story of love, reputation, and class featuring Elizabeth Bennet and Mr. Darcy.";
    case 'Eleanor & Park':
      return "A coming-of-age romance between two misfit teenagers in 1986.";
    case 'From Lukov With Love':
      return "An intense figure skating romance between enemies turned partners.";
    case 'The Gilded Wolves':
      return "In 1889 Paris, a band of misfits hunt for an ancient artifact in a world of magic and secrets.";
    case 'Jade City':
      return "A gripping saga of honor, blood, and jade in an Asian-inspired fantasy city.";
    case 'The Song of Achilles':
      return "A tender retelling of the Iliad through the eyes of Patroclus, lover of the hero Achilles.";
    case 'The Silent Patient':
      return "A shocking psychological thriller about a woman who stops speaking after a brutal crime.";
    case 'The Thursday Murder Club':
      return "Four elderly sleuths investigate a murder at their retirement village—charming and clever.";
    case 'Don’t Open Your Eyes':
      return "A suspenseful thriller following a mother’s nightmare as secrets unfold about her daughter.";
    default:
      return "No description available.";
  }
}


