import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeSwitchBottomAppBar<TypeCubit extends Cubit> extends StatelessWidget {
  const MeSwitchBottomAppBar(
      {super.key, required this.addEvent, required this.initValue});
  final bool initValue;
  final Function() addEvent;

  @override
  Widget build(BuildContext context) {
    bool valueItem = initValue;
    return BlocBuilder(
        bloc: context.read<TypeCubit>(),
        builder: (context, state) {
          return Switch(
              onChanged: (bool value) {
                valueItem = value;
                addEvent();
              },
              value: valueItem);
        });
  }
}
