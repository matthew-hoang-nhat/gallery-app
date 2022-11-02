import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/routes/routes_name_app.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My widget'),
        actions: const [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(CupertinoIcons.person_alt_circle))
        ],
      ),
      body: SafeArea(
          child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Cupertino'),
            subtitle: const Text(
                'Beautiful and high-fidelity widgets for current iOS design language.'),
            leading: const Icon(Icons.phone_android_rounded),
            onTap: () {
              context.push(Paths.cupertinoScreen);
            },
          ),
          ListTile(
            title: const Text('Typography'),
            subtitle: const Text('All of the predefined text styles'),
            leading: const Icon(Icons.title),
            onTap: () {
              context.push(Paths.textSpanScreen);
            },
          ),
          ListTile(
            title: const Text('Bottom app bar'),
            subtitle: const Text('Bottom application bar'),
            leading: const Icon(CupertinoIcons.line_horizontal_3),
            onTap: () {
              context.push(Paths.bottomAppBarViewScreen);
            },
          ),
          ListTile(
            title: const Text('Button'),
            subtitle: const Text(
                'RaisedButton, FlatButton, DropDownButton, FloatingActionButton, IconButton, InkWell, RawMaterialButton'),
            leading: const Icon(CupertinoIcons.table),
            onTap: () {
              context.push(Paths.buttonScreen);
            },
          ),
          ListTile(
            title: const Text('List'),
            subtitle: const Text('Scrolling list layout'),
            leading: const Icon(CupertinoIcons.list_bullet),
            onTap: () {
              context.push(Paths.rowColumnScreen);
            },
          ),
          ListTile(
            title: const Text('Card'),
            subtitle: const Text('Cards with rounded corners and decoration'),
            leading: const Icon(Icons.card_membership_sharp),
            onTap: () {
              context.push(Paths.containerScreen);
            },
          ),
          ListTile(
            title: const Text('CustomBoxShape'),
            subtitle: const Text(
                'A single fixed-height row that typically contains some text as well as a leading or trailing icon.'),
            leading: const Icon(Icons.list),
            onTap: () {
              context.push(Paths.customBoxShapeScreen);
            },
          ),
          ListTile(
            title: const Text('Alert'),
            subtitle: const Text('Alerts, SnackBar & Tooltip'),
            leading: const Icon(CupertinoIcons.arrow_up_left_arrow_down_right),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Text Field'),
            subtitle: const Text('TextField, TextFieldForm'),
            leading: const Icon(CupertinoIcons.line_horizontal_3),
            onTap: () {
              context.push(Paths.textFieldScreen);
            },
          ),
          ListTile(
            title: const Text('Row & Column'),
            subtitle: const Text(
                'A widget that displays its children in a horizontal and vertical array'),
            leading: const Icon(CupertinoIcons.waveform_path),
            onTap: () {
              context.push(Paths.rowColumnScreen);
            },
          ),
          ListTile(
            title: const Text('Wrap & Chip'),
            subtitle: const Text('Wrap & Chip'),
            leading: const Icon(Icons.list),
            onTap: () {
              context.push(Paths.wrapChipScreen);
            },
          ),
          ListTile(
            title: const Text('Stack & Align'),
            subtitle:
                const Text('A widget that positions its children relative'),
            leading: const Icon(CupertinoIcons.square_stack_3d_down_right_fill),
            onTap: () {
              context.push(Paths.stackAlignScreen);
            },
          ),
        ],
      )),
    );
  }
}
