import 'package:gallery_app/src/config/routes/routes_name_app.dart';
import 'package:gallery_app/src/core/home_screen/home_screen.dart';
import 'package:gallery_app/src/features/bottom_appbar_view/screens/bottom_appbar_view_screen.dart';
import 'package:gallery_app/src/features/button/screens/button_screen.dart';
import 'package:gallery_app/src/features/container/screens/container_screen.dart';
import 'package:gallery_app/src/features/cupertino/screens/cupertino_screen.dart';
import 'package:gallery_app/src/features/custom_box_shape/screens/custom_box_shape_screen.dart';
import 'package:gallery_app/src/features/row_column/row_column_screen.dart';
import 'package:gallery_app/src/features/stack_align/screens/stack_align_screen.dart';
import 'package:gallery_app/src/features/text_field/screens/text_field_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/text_span/text_span_screen.dart';
import '../../features/wrap_chip/screens/wrap_chip_screen.dart';

class AppPages {
  static const List<String> needAuthenticatedPages = [
    // AppPages.profile,
  ];

  static final pages = <GoRoute>[
    GoRoute(
      path: Paths.textSpanScreen,
      builder: (context, state) => const TextSpanScreen(),
    ),
    GoRoute(
      path: Paths.rowColumnScreen,
      builder: (context, state) => const RowColumnScreen(),
    ),
    GoRoute(
      path: Paths.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Paths.stackAlignScreen,
      builder: (context, state) => const StackAlignScreen(),
    ),
    GoRoute(
      path: Paths.containerScreen,
      builder: (context, state) => const ContainerScreen(),
    ),
    GoRoute(
      path: Paths.textFieldScreen,
      builder: (context, state) => const TextFieldScreen(),
    ),
    GoRoute(
      path: Paths.buttonScreen,
      builder: (context, state) => const ButtonScreen(),
    ),
    GoRoute(
      path: Paths.cupertinoScreen,
      builder: (context, state) => const CupertinoScreen(),
    ),
    GoRoute(
      path: Paths.wrapChipScreen,
      builder: (context, state) => const WrapChipScreen(),
    ),
    GoRoute(
      path: Paths.customBoxShapeScreen,
      builder: (context, state) => const CustomBoxShapeScreen(),
    ),
    GoRoute(
      path: Paths.bottomAppBarViewScreen,
      builder: (context, state) => BottomAppBarViewScreen(),
    ),
  ];
}
