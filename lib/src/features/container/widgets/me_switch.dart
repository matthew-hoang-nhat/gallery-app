import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeContainerSwitch<T, TypeCubit extends Cubit> extends StatelessWidget {
  const MeContainerSwitch(
      {super.key, required this.items, required this.addEvent});
  final List<Map<T, bool>> items;
  final Function addEvent;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TypeCubit>(context);
    bool valueItem = items[0].values.first;
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
