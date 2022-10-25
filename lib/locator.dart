import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/routes/app_routers.dart';

import 'app.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _locator();
}

void _locator() {
  getIt.registerSingleton(const AppRouter());
}
