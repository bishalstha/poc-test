import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/books');
              },
              child: const Text('books'),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/books/30');
              },
              child: const Text('book 30'),
            ),
          ],
        ),
      ),
    );
  }
}
