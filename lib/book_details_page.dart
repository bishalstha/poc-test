import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final int bookId;

  const BookDetailsPage({
    Key? key,
    @PathParam('id') required this.bookId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$bookId'),
      ),
    );
  }
}
