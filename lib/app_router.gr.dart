// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    BookListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BookListPage());
    },
    BookDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookDetailsRouteArgs>(
          orElse: () => BookDetailsRouteArgs(bookId: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: BookDetailsPage(key: args.key, bookId: args.bookId));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(BookListRoute.name, path: '/books'),
        RouteConfig(BookDetailsRoute.name, path: '/books/:id')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [BookListPage]
class BookListRoute extends PageRouteInfo<void> {
  const BookListRoute() : super(BookListRoute.name, path: '/books');

  static const String name = 'BookListRoute';
}

/// generated route for
/// [BookDetailsPage]
class BookDetailsRoute extends PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({Key? key, required int bookId})
      : super(BookDetailsRoute.name,
            path: '/books/:id',
            args: BookDetailsRouteArgs(key: key, bookId: bookId),
            rawPathParams: {'id': bookId});

  static const String name = 'BookDetailsRoute';
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({this.key, required this.bookId});

  final Key? key;

  final int bookId;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, bookId: $bookId}';
  }
}
