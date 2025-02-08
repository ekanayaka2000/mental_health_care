import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'The Mindful Way Through Depression',
      'author': 'Mark Williams',
      'price': '\$14.99',
    },
    {
      'title': 'Feeling Good: The New Mood Therapy',
      'author': 'David D. Burns',
      'price': '\$12.99',
    },
    {
      'title': 'Lost Connections',
      'author': 'Johann Hari',
      'price': '\$16.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        automaticallyImplyLeading: false, // Removes the back arrow
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                book['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${book['author']}\nPrice: ${book['price']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
