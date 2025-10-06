
import 'dart:io' show File;
import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart'; // ✅ Import para redirect

class AddBookScreen extends StatefulWidget {
const AddBookScreen({super.key});

@override
State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
String title = "Book Title";
String author = "Unknown Author";
int pages = 0;
String language = "English";
String description = "Book description goes here.";
int rating = 0;
String review = "";

/// 🔑 Store picked image path (works on both Web & Mobile)
String? _pickedImagePath;

final TextEditingController _titleController = TextEditingController();
final TextEditingController _authorController = TextEditingController();
final TextEditingController _pagesController = TextEditingController();
final TextEditingController _languageController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

@override
void initState() {
super.initState();
_titleController.text = title;
_authorController.text = author;
_pagesController.text = pages.toString();
_languageController.text = language;
_descriptionController.text = description;
}

Future<void> _pickImage() async {
final picker = ImagePicker();
final pickedFile = await picker.pickImage(source: ImageSource.gallery);
if (pickedFile != null) {
setState(() {
_pickedImagePath = pickedFile.path; // store path only
});
}
}

Future<void> _showEditDialog() async {
_titleController.text = title;
_authorController.text = author;
_pagesController.text = pages.toString();
_languageController.text = language;
_descriptionController.text = description;

await showDialog(
context: context,
builder: (context) {
return AlertDialog(
backgroundColor: const Color(0xFFFAF3F3),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
title: const Text(
"Edit Book Details",
style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3C090E)),
),
content: SingleChildScrollView(
child: Column(
children: [
TextField(controller: _titleController, decoration: const InputDecoration(labelText: "Book Title")),
const SizedBox(height: 8),
TextField(controller: _authorController, decoration: const InputDecoration(labelText: "Author")),
const SizedBox(height: 8),
TextField(controller: _pagesController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Pages")),
const SizedBox(height: 8),
TextField(controller: _languageController, decoration: const InputDecoration(labelText: "Language")),
const SizedBox(height: 8),
TextField(controller: _descriptionController, maxLines: 4, decoration: const InputDecoration(labelText: "Description")),
],
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text("Cancel", style: TextStyle(color: Colors.red)),
),
ElevatedButton(
onPressed: () {
setState(() {
title = _titleController.text;
author = _authorController.text;
pages = int.tryParse(_pagesController.text) ?? 0;
language = _languageController.text;
description = _descriptionController.text;
});
// ✅ Redirect to HomeScreen after saving
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const BookHomeScreen()),
);
},
style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3C090E)),
child: const Text("Save", style: TextStyle(color: Colors.white)),
),
],
);
},
);
}

Future<void> _showReviewDialog() async {
int tempRating = rating;
TextEditingController reviewController = TextEditingController(text: review);
await showDialog(
context: context,
builder: (context) {
return StatefulBuilder(builder: (context, setStateDialog) {
return AlertDialog(
backgroundColor: const Color(0xFFFAF3F3),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
title: const Text("Write a Review", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3C090E))),
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(5, (index) {
return IconButton(
icon: Icon(index < tempRating ? Icons.star : Icons.star_border, color: const Color(0xFF3C090E)),
onPressed: () => setStateDialog(() => tempRating = index + 1),
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
border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
),
),
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
rating = tempRating;
review = reviewController.text;
});
Navigator.pop(context);
},
style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3C090E)),
child: const Text("Submit", style: TextStyle(color: Colors.white)),
),
],
);
});
},
);
}

Widget _decorativeLine({double width = 390, double height = 2}) {
return Center(
child: Column(
children: [
const SizedBox(height: 12),
Container(height: height, width: width, color: const Color(0xFF3C090E)),
const SizedBox(height: 12),
],
),
);
}

/// 🖼️ Picture Frame with Placeholder + Plus Button
Widget _buildPictureFrame(double width, double height) {
return GestureDetector(
onTap: _pickImage,
child: Container(
width: width,
height: height,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
border: Border.all(color: const Color(0xFF3C090E), width: 2, style: BorderStyle.solid),
),
child: _pickedImagePath == null
? Center(
child: Icon(Icons.add, size: 40, color: const Color(0xFF3C090E)),
)
    : Stack(
children: [
ClipRRect(
borderRadius: BorderRadius.circular(12),
child: kIsWeb
? Image.network(_pickedImagePath!, width: width, height: height, fit: BoxFit.cover)
    : Image.file(File(_pickedImagePath!), width: width, height: height, fit: BoxFit.cover),
),
Positioned(
bottom: 8,
right: 8,
child: Container(
decoration: BoxDecoration(
color: Colors.black.withOpacity(0.6),
shape: BoxShape.circle,
),
child: const Padding(
padding: EdgeInsets.all(6),
child: Icon(Icons.add, color: Colors.white, size: 24),
),
),
),
],
),
),
);
}

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

// 🟤 Full-width divider after search bar
Container(height: 2, width: double.infinity, color: const Color(0xFF3C090E)),

// 📕 Book Image + Title + Author
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
child: _pickedImagePath == null
? Container(width: 550, height: 260, color: Colors.black.withOpacity(0.1))
    : (kIsWeb
? Image.network(_pickedImagePath!, width: 550, height: 260, fit: BoxFit.cover)
    : Image.file(File(_pickedImagePath!), width: 550, height: 260, fit: BoxFit.cover)),
),
),
_buildPictureFrame(150, 220), // ⬅️ Frame in foreground
],
),
const SizedBox(height: 12),
GestureDetector(
onTap: _showEditDialog,
child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3C090E)), textAlign: TextAlign.center),
),
const SizedBox(height: 4),
GestureDetector(
onTap: _showEditDialog,
child: Text(author, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF3C090E))),
),
],
),
),

// 🟤 Divider After Author
_decorativeLine(),

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
Text('$pages', style: const TextStyle(fontWeight: FontWeight.bold)),
const Text("Pages"),
],
),
Column(
children: [
Row(
children: List.generate(5, (index) {
return Icon(index < rating ? Icons.star : Icons.star_border, size: 18, color: const Color(0xFF3C090E));
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
Text(language, style: const TextStyle(fontWeight: FontWeight.bold)),
const Text("Language"),
],
),
],
),
),

// 🟤 Divider After Book Info
_decorativeLine(),

// 📝 Write a Review
Center(
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF3C090E),
padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
),
onPressed: _showReviewDialog,
child: Text(rating > 0 ? "Review ($rating★)" : "Write a Review", style: const TextStyle(color: Colors.white)),
),
),

// 🟤 Divider After Review Button
_decorativeLine(),

// 📖 Book Description Label
const Center(
child: Text("Book Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3C090E))),
),

// 🟤 Divider Below Label (smaller)
Center(
child: Column(
children: [
const SizedBox(height: 12),
Container(height: 4, width: 180, color: const Color(0xFF3C090E)),
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
child: Text(description, style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5)),
),
),
),
],
),
),
);
}
}

