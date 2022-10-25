import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeDropDown<T, TypeCubit extends Cubit> extends StatelessWidget {
  const MeDropDown({super.key, required this.items, required this.addEvent});
  final List<T> items;
  final Function addEvent;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TypeCubit>(context);
    T valueItem = items[0];
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return DropdownButton(
            items: items.map((T value) {
              final splitTitle = value.toString().split('.');
              final title = splitTitle.elementAt(splitTitle.length - 1);
              return DropdownMenuItem<T>(
                value: value,
                child: Text(title),
              );
            }).toList(),
            value: valueItem,
            onChanged: (value) {
              valueItem = value as T;
              addEvent(value);
            },
          );
        });
  }
}
