import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constants/app_colors.dart';
import '../../row_column/widgets/me_drop_down.dart';
import '../cubit/stack_align_cubit.dart';
part './widgets/square.dart';

class StackAlignScreen extends StatelessWidget {
  const StackAlignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final widgets = [
      bigSquare,
      miniSquare,
    ];

    final alignments = [
      Alignment.center,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.topCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.bottomCenter,
    ];

    final textDirections = [
      TextDirection.ltr,
      TextDirection.rtl,
    ];

    final stackFits = [
      StackFit.loose,
      StackFit.passthrough,
    ];

    final clips = [
      Clip.antiAlias,
      Clip.none,
      Clip.antiAliasWithSaveLayer,
      Clip.hardEdge,
    ];

    final bloc = context.read<StackAlignCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Stack & Alignment')),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<StackAlignCubit, StackAlignState>(
            builder: (BuildContext context, state) {
              return SizedBox(
                child: Center(
                  child: Stack(
                    alignment: state.alignment,
                    textDirection: state.textDirection,
                    fit: state.stackFit,
                    clipBehavior: state.clip,
                    children: widgets,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('alignments'),
                    MeDropDown<Alignment, StackAlignCubit>(
                      items: alignments,
                      addEvent: bloc.addNewEvent,
                      initValue: bloc.state.alignment,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('textDirection'),
                    MeDropDown<TextDirection, StackAlignCubit>(
                        items: textDirections,
                        addEvent: bloc.addNewEvent,
                        initValue: bloc.state.textDirection),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('stackFit'),
                    MeDropDown<StackFit, StackAlignCubit>(
                        items: stackFits,
                        addEvent: bloc.addNewEvent,
                        initValue: bloc.state.stackFit),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('clip'),
                    MeDropDown<Clip, StackAlignCubit>(
                        items: clips,
                        addEvent: bloc.addNewEvent,
                        initValue: bloc.state.clip),
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
