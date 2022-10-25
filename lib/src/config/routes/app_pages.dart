import 'package:gallery_app/src/core/home_screen/home_screen.dart';
import 'package:gallery_app/src/features/row_column/row_column_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/text_span/text_span_screen.dart';

class AppPages {
  static const String textSpanScreen = _Paths.textSpanScreen;
  static const String homeScreen = _Paths.homeScreen;
  static const String rowColumnScreen = _Paths.rowColumnScreen;

  static const List<String> needAuthenticatedPages = [
    // AppPages.profile,
  ];

  static final pages = <GoRoute>[
    GoRoute(
      path: textSpanScreen,
      builder: (context, state) => const TextSpanScreen(),
    ),
    GoRoute(
      path: rowColumnScreen,
      builder: (context, state) => const RowColumnScreen(),
    ),
    GoRoute(
      path: homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}

abstract class _Paths {
  static const String homeScreen = "/";
  static const String textSpanScreen = "/text-span-screen";
  static const String rowColumnScreen = "/row-column-screen";
}
