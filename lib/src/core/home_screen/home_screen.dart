import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/routes/routes_name_app.dart';
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
              context.push(Paths.textSpanScreen);
            },
            child: const Text('Text span'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.rowColumnScreen);
            },
            child: const Text('Row Column'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.stackAlignScreen);
            },
            child: const Text('Stack Align'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.containerScreen);
            },
            child: const Text('Container'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.textFieldScreen);
            },
            child: const Text('Text Field'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.buttonScreen);
            },
            child: const Text('Button'),
          ),
          TextButton(
            onPressed: () {
              context.push(Paths.cupertinoScreen);
            },
            child: const Text('Cupertino'),
          ),
        ],
      )),
    );
  }
}
