import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';

class MeDropDown<T> extends StatelessWidget {
  const MeDropDown({super.key, required this.items});
  final List<T> items;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RowColumnCubit>(context);
    T valueItem = items[0];
    return BlocBuilder<RowColumnCubit, RowColumnState>(
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
              bloc.addNewEvent(value);
            },
          );
        });
  }
}
