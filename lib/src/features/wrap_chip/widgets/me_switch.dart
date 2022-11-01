import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeWrapTextSwitch<TypeCubit extends Cubit> extends StatelessWidget {
  const MeWrapTextSwitch(
      {super.key, required this.addEvent, required this.initValue});
  final bool initValue;
  final Function() addEvent;

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<TypeCubit>(context);
    bool valueItem = initValue;
    return BlocBuilder(
        // bloc: bloc,
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
