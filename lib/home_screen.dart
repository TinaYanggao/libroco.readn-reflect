import 'package:flutter/material.dart';

class BookHomeScreen extends StatelessWidget {
  const BookHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5BEBE),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset(
                'assets/logo.png',
                height: 80,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Books to Read',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Track your reading list and stay inspired with your favorite stories.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3C090E),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF3C090E),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: const [
                      BookTile(title: 'The Midnight Library'),
                      BookTile(title: 'It Ends With Us'),
                      BookTile(title: 'Atomic Habits'),
                      BookTile(title: 'The Seven Husbands of Evelyn Hugo'),
                      BookTile(title: 'The Silent Patient'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3F1E24),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/books.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/stack.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/journal.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/weather.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/profile.png')),
            label: '',
          ),
        ],
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  final String title;
  const BookTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD5BEBE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFF3C090E),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
