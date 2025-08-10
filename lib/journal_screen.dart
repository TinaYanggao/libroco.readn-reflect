import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'WritingJournal_screen.dart';

class Note {
  String content;
  DateTime date;

  Note({
    required this.content,
    required this.date,
  });
}

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  List<Note> notes = [
    Note(
      content:
      "Grabe. When the Elephants Dance? Hindi ako ready sa punch sa puso. Akala ko historical lang siya, pero BOOM — trauma, myth, and truth all in one. Like hello, bakit parang lahat ng tao dito ay either napighinalo, nawawala, o may dala-dalang bigat sa dibdib? Pero at the same time, parang may magic? May kwento sa kwento. A story within a story...",
      date: DateTime(2025, 7, 9),
    ),
    Note(
      content:
      "Dosage of Serotonin by Inksteady? BES SOBRANG FEELS 😭 Parang ako yung may trust issues tas tinuruan akong magmahal ulit ng slow burn na may halong poetry charot~ 🫶 Gusto ko nang ng konting kilig pero ayan, sinapak ako ng emotions. 😢😢 Literal na serotonin overload, tapos lyuk–then–smile combo HAHAHUHU.",
      date: DateTime(2024, 12, 31),
    ),
    Note(
      content: "Third note here, testing grid view.",
      date: DateTime(2025, 1, 15),
    ),
    Note(
      content: "Fourth note here, small and nice.",
      date: DateTime(2025, 2, 20),
    ),
  ];

  // Open WritingJournalScreen to add a new note
  void _openWritingJournalScreen() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const WritingJournalScreen()),
    );

    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        notes.add(Note(content: result.trim(), date: DateTime.now()));
      });
    }
  }

  // Open WritingJournalScreen to edit existing note
  void _openNoteDetail(Note note, int index) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => WritingJournalScreen(initialContent: note.content),
      ),
    );

    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        notes[index] = Note(content: result.trim(), date: DateTime.now());
      });
    }
  }

  String _formatDateSimple(DateTime date) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final day = date.day;
    final month = months[date.month];
    final year = date.year;
    return '$day $month $year';
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = 16 * 2; // left + right padding
    final double screenWidth = MediaQuery.of(context).size.width;
    final double spacing = 12; // spacing between grid items

    // Calculate width for 2 columns in grid with spacing
    final double itemWidth = (screenWidth - horizontalPadding - spacing) / 2;
    final double itemHeight = itemWidth; // square items

    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Column(
          children: [
            // 🔝 Header
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
            Container(height: 2, width: double.infinity, color: Color(0xFF3C090E)),
            const SizedBox(height: 6),
            const Text(
              'Journal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C090E),
              ),
            ),
            const SizedBox(height: 6),
            Container(height: 2, width: double.infinity, color: Color(0xFF3C090E)),
            const SizedBox(height: 10),

            // Notes Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: notes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: 1, // square
                  ),
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return GestureDetector(
                      onTap: () => _openNoteDetail(note, index),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                note.content.length > 80
                                    ? "${note.content.substring(0, 80)}..."
                                    : note.content,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _formatDateSimple(note.date),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3C090E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: _openWritingJournalScreen,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF918D8C),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(18),
          child: Image.asset(
            'assets/icons/journal.png',
            fit: BoxFit.contain,
            color: Colors.white, // optional tint
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
