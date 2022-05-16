import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poc/book_details_page.dart';
import 'package:poc/book_list_page.dart';
import 'package:poc/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: BookListPage, path: '/books'),
    AutoRoute(page: BookDetailsPage, path: '/books/:id'),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
