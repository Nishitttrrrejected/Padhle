import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Book {
  final String title;
  final String author;
  final File bookFile;

  Book({
    required this.title,
    required this.author,
    required this.bookFile,
  });
}

List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8];

// Function to load book file from assets
Future<File> loadBookFile(String filePath) async {
  final ByteData data = await rootBundle.load('assets/books/$filePath');
  final List<int> bytes = data.buffer.asUint8List();
  final File file = File(filePath);
  await file.writeAsBytes(bytes);
  return file;
}

// books data
Future<List<Book>> loadBooks() async {
  // Load books data [how to load this data from an api or database?]
  List<Book> books = [
    Book(
      title: 'Discrete Math',
      author: 'Author',
      bookFile: await loadBookFile('book1.pdf'),
    ),
    Book(
      title: 'Book2',
      author: 'Author2',
      bookFile: await loadBookFile('book2.pdf'),
    ),
    // Add more books as needed
  ];

  return books;
}
