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
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true), // Save
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C090E), // dark reddish-brown
            ),
            child: const Text('Save', style: TextStyle(color: Colors.white)),
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

  void _deleteNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFAF3F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "Delete Journal?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C090E),
          ),
        ),
        content: const Text(
          "Are you sure you want to delete this journal entry?",
          style: TextStyle(color: Color(0xFF3C090E)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context, "DELETE"); // return DELETE signal
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3C090E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Delete",
              style: TextStyle(
                color: Color(0xFFFAF3F3), // cream text
              ),
            ),
          ),
        ],
      ),
    );
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
              // Back + Delete button row
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 8,
                  bottom: 4,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF3C090E),
                      ),
                      onPressed: () => _onWillPop(),
                    ),
                    if (widget.initialContent != null)
                      ElevatedButton(
                        onPressed: _deleteNote,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3C090E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Color(0xFFFAF3F3), // cream text
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Divider, READ label, Divider
              const Divider(height: 2, thickness: 2, color: Color(0xFF3C090E)),
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
              const Divider(height: 2, thickness: 2, color: Color(0xFF3C090E)),
              const SizedBox(height: 10),

              // Journal writing area
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
                        borderSide: const BorderSide(
                          color: Color(0xFF3C090E),
                          width: 2,
                        ),
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