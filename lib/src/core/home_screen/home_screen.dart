import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/routes/app_pages.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              context.push(AppPages.textSpanScreen);
            },
            child: const Text('Text span'),
          ),
          TextButton(
            onPressed: () {
              context.push(AppPages.rowColumnScreen);
            },
            child: const Text('Row Column'),
          ),
          TextButton(
            onPressed: () {
              context.push(AppPages.stackAlignScreen);
            },
            child: const Text('Stack Align'),
          ),
          TextButton(
            onPressed: () {
              context.push(AppPages.containerScreen);
            },
            child: const Text('Container'),
          ),
          TextButton(
            onPressed: () {
              context.push(AppPages.textFieldScreen);
            },
            child: const Text('Text Field'),
          ),
        ],
      )),
    );
  }
}
