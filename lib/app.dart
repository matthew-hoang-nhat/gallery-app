import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'src/config/routes/routers_app.dart';

final getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(textTheme: const TextTheme()),
      routerConfig: getIt<AppRouter>().router,
    );
  }
}
