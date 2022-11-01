import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeTextFieldSwitch<TypeCubit extends Cubit> extends StatelessWidget {
  const MeTextFieldSwitch(
      {super.key, required this.addEvent, required this.initValue});
  final Function() addEvent;
  final bool initValue;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TypeCubit>();
    bool valueItem = initValue;
    return BlocBuilder(
        bloc: bloc,
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
