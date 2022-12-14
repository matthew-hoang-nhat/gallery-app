import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeContainerDropDown<T, TypeCubit extends Cubit> extends StatelessWidget {
  const MeContainerDropDown(
      {super.key,
      required this.items,
      required this.addEvent,
      required this.initValue});
  final List<Map<T, String>> items;
  final Function addEvent;
  final Map<T, String> initValue;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TypeCubit>();
    Map<T, String> valueItem = initValue;
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return DropdownButton(
            items: items.map((Map<T, String> value) {
              return DropdownMenuItem<Map<T, String>>(
                value: value,
                child: Text(value.values.first),
              );
            }).toList(),
            value: valueItem,
            onChanged: (value) {
              valueItem = value as Map<T, String>;
              addEvent(value.keys.first);
            },
          );
        });
  }
}
