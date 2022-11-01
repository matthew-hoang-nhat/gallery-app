import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  final List<Widget> children = [
    Container(
        width: 100, alignment: Alignment.center, child: const Text('Option 1')),
    Container(
        alignment: Alignment.center, width: 100, child: const Text('Option 2')),
    Container(
        alignment: Alignment.center, width: 100, child: const Text('Option 3')),
  ];
  final List<bool> selection = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: selection,
      onPressed: ((index) {
        selection[index] = !selection[index];
        setState(() {});
      }),
      children: children,
    );
  }
}
