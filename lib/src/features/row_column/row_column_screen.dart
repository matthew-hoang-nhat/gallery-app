import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gallery_app/src/config/constants/app_colors.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_app/src/features/row_column/widgets/me_drop_down.dart';

import 'widgets/start_widget.dart';

class RowColumnScreen extends StatefulWidget {
  const RowColumnScreen({super.key});

  @override
  State<RowColumnScreen> createState() => _RowColumnScreenState();
}

class _RowColumnScreenState extends State<RowColumnScreen> {
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

  RowColumnCubit bloc = RowColumnCubit();
  final List<bool> isColumns = [true, false];
  bool isColumn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row & Column')),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<RowColumnCubit, RowColumnState>(
            bloc: bloc,
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
            child: BlocProvider(
              create: (context) => bloc,
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
                      MeDropDown<MainAxisSize>(items: mainAxisSizes),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('mainAxisAlignments'),
                      MeDropDown<MainAxisAlignment>(items: mainAxisAlignments),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('crossAxisAlignment'),
                      MeDropDown<CrossAxisAlignment>(
                          items: crossAxisAlignments),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('verticalDirection'),
                      MeDropDown<VerticalDirection>(items: verticalDirections),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('textDirection'),
                      MeDropDown<TextDirection>(items: textDirections),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('textBaseline'),
                      MeDropDown<TextBaseline>(items: textBaselines),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
