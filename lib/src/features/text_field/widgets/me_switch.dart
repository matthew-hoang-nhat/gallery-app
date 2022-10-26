import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeTextFieldSwitch<TypeCubit extends Cubit> extends StatelessWidget {
  const MeTextFieldSwitch({super.key, required this.addEvent});
  final Function() addEvent;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TypeCubit>(context);
    bool valueItem = false;
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
