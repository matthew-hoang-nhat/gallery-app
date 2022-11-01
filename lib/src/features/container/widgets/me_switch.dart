import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeContainerSwitch<T, TypeCubit extends Cubit> extends StatelessWidget {
  const MeContainerSwitch(
      {super.key,
      required this.items,
      required this.addEvent,
      required this.initValue});
  final List<Map<T, bool>> items;
  final Function addEvent;
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
                addEvent(items
                    .firstWhere((element) => element.values.first == value)
                    .keys
                    .first);
              },
              value: valueItem);
        });
  }
}
