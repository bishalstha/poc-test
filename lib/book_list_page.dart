import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poc/app_router.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              context.router.push(BookDetailsRoute(bookId: index));
            },
            title: Text('$index'),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
