import 'package:flutter/material.dart';

class WritingJournalScreen extends StatefulWidget {
  final String? initialContent;

  const WritingJournalScreen({Key? key, this.initialContent}) : super(key: key);

  @override
  State<WritingJournalScreen> createState() => _WritingJournalScreenState();
}

class _WritingJournalScreenState extends State<WritingJournalScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialContent ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFAF3F3), // light pink/cream background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Save Journal?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C090E), // dark reddish-brown
          ),
        ),
        content: const Text(
          'Would you like to save your journal?',
          style: TextStyle(color: Color(0xFF3C090E)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Don't save
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true), // Save
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C090E), // dark reddish-brown
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (shouldSave == true) {
      Navigator.pop(context, _controller.text.trim());
      return false; // prevent default pop, since we manually popped already
    } else {
      Navigator.pop(context); // pop without saving
      return false; // prevent default pop, already handled
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xFF947887),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button row
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF3C090E)),
                    onPressed: () => _onWillPop(),
                  ),
                ),
              ),

              // Divider, READ text, Divider, spacing
              const Divider(
                height: 2,
                thickness: 2,
                color: Color(0xFF3C090E),
                indent: 0,
                endIndent: 0,
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'READ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Divider(
                height: 2,
                thickness: 2,
                color: Color(0xFF3C090E),
                indent: 0,
                endIndent: 0,
              ),
              const SizedBox(height: 10),

              // Journal writing area fills the rest
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Write your journal here...',
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3C090E), width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
