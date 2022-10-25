import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_pages.dart';

class AppRouter {
  // const AppRouter(this._appBloc);
  const AppRouter();
  // final AppBloc _appBloc;

  GoRouter get router => GoRouter(
        initialLocation: AppPages.stackAlignScreen,
        routes: AppPages.pages,
        debugLogDiagnostics: true,
        // observers: [],
        // refreshListenable: GoRouterRefreshStream(_appBloc.stream),
        redirect: (context, state) => _redirect(context, state),
      );

  _redirect(BuildContext context, GoRouterState state) {
    // final isLoggedIn = getIt.get<AppShared>().getLoginValue();
    // if (AppPages.needAuthenticatedPages.contains(state.location) &&
    //     isLoggedIn == false) {
    //   return AppPages.login;
    // }
    return null;
  }
}
