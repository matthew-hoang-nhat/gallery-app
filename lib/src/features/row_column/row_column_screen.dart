import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gallery_app/src/config/constants/app_colors.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_app/src/features/row_column/widgets/me_drop_down.dart';

import 'widgets/start_widget.dart';

class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final widgets = [
      startWidget(size: 1),
      const SizedBox(
        height: 30,
        width: 30,
      ),
      startWidget(size: 2),
      const SizedBox(
        height: 30,
        width: 30,
      ),
      startWidget(size: 1),
    ];
    final mainAxisAlignments = [
      MainAxisAlignment.center,
      MainAxisAlignment.end,
      MainAxisAlignment.spaceAround,
      MainAxisAlignment.spaceBetween,
      MainAxisAlignment.spaceEvenly,
    ];
    final crossAxisAlignments = [
      CrossAxisAlignment.center,
      CrossAxisAlignment.end,
      CrossAxisAlignment.start,
    ];
    final textBaselines = [
      TextBaseline.alphabetic,
      TextBaseline.ideographic,
    ];
    final mainAxisSizes = [
      MainAxisSize.min,
      MainAxisSize.max,
    ];
    final textDirections = [
      TextDirection.ltr,
      TextDirection.rtl,
    ];
    final verticalDirections = [
      VerticalDirection.down,
      VerticalDirection.up,
    ];
    RowColumnCubit bloc = context.read<RowColumnCubit>();
    bool isColumn = bloc.state.isColumn;
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column')),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<RowColumnCubit, RowColumnState>(
            builder: (BuildContext context, state) {
              return Container(
                  width: double.infinity,
                  color: AppColors.yellow,
                  padding: const EdgeInsets.all(20),
                  child: state.isColumn == true
                      ? Column(
                          mainAxisSize: state.mainAxisSize,
                          mainAxisAlignment: state.mainAxisAlignment,
                          crossAxisAlignment: state.crossAxisAlignment,
                          textBaseline: state.textBaseline,
                          textDirection: state.textDirection,
                          verticalDirection: state.verticalDirection,
                          children: widgets)
                      : Row(
                          mainAxisSize: state.mainAxisSize,
                          mainAxisAlignment: state.mainAxisAlignment,
                          crossAxisAlignment: state.crossAxisAlignment,
                          textBaseline: state.textBaseline,
                          textDirection: state.textDirection,
                          verticalDirection: state.verticalDirection,
                          children: widgets));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                BlocBuilder<RowColumnCubit, RowColumnState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            title: const Text('Row'),
                            leading: Radio(
                              value: false,
                              groupValue: isColumn,
                              onChanged: (value) {
                                isColumn = value as bool;
                                bloc.addNewEvent(false);
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            title: const Text('Column'),
                            leading: Radio(
                              value: true,
                              groupValue: isColumn,
                              onChanged: (value) {
                                isColumn = value as bool;
                                bloc.addNewEvent(true);
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('mainAxisSize'),
                    MeDropDown<MainAxisSize, RowColumnCubit>(
                      items: mainAxisSizes,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.mainAxisSize,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('mainAxisAlignments'),
                    MeDropDown<MainAxisAlignment, RowColumnCubit>(
                      items: mainAxisAlignments,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.mainAxisAlignment,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('crossAxisAlignment'),
                    MeDropDown<CrossAxisAlignment, RowColumnCubit>(
                      items: crossAxisAlignments,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.crossAxisAlignment,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('verticalDirection'),
                    MeDropDown<VerticalDirection, RowColumnCubit>(
                      items: verticalDirections,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.verticalDirection,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('textDirection'),
                    MeDropDown<TextDirection, RowColumnCubit>(
                      items: textDirections,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.textDirection,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('textBaseline'),
                    MeDropDown<TextBaseline, RowColumnCubit>(
                      items: textBaselines,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.textBaseline,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
