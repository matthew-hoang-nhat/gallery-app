import 'package:gallery_app/src/core/home_screen/home_screen.dart';
import 'package:gallery_app/src/features/container/screens/container_screen.dart';
import 'package:gallery_app/src/features/row_column/row_column_screen.dart';
import 'package:gallery_app/src/features/stack_align/screens/stack_align_screen.dart';
import 'package:gallery_app/src/features/text_field/screens/text_field_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/text_span/text_span_screen.dart';

class AppPages {
  static const String textSpanScreen = _Paths.textSpanScreen;
  static const String homeScreen = _Paths.homeScreen;
  static const String rowColumnScreen = _Paths.rowColumnScreen;
  static const String stackAlignScreen = _Paths.stackAlignScreen;
  static const String containerScreen = _Paths.containerScreen;
  static const String textFieldScreen = _Paths.textFieldScreen;

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
    GoRoute(
      path: stackAlignScreen,
      builder: (context, state) => const StackAlignScreen(),
    ),
    GoRoute(
      path: containerScreen,
      builder: (context, state) => const ContainerScreen(),
    ),
    GoRoute(
      path: textFieldScreen,
      builder: (context, state) => const TextFieldScreen(),
    ),
  ];
}

abstract class _Paths {
  static const String homeScreen = "/";
  static const String textSpanScreen = "/text-span-screen";
  static const String rowColumnScreen = "/row-column-screen";
  static const String stackAlignScreen = "/stack-align-screen";
  static const String containerScreen = "/container-screen";
  static const String textFieldScreen = "/text-field-screen";
}
