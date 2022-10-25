import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';

part 'stack_align_state.dart';

class StackAlignCubit extends Cubit<StackAlignState> implements ParentCubit {
  StackAlignCubit()
      : super(const StackAlignInitial(
          alignment: Alignment.center,
          clip: Clip.antiAlias,
          stackFit: StackFit.loose,
          textDirection: TextDirection.ltr,
        ));

  @override
  void addNewEvent(value) {
    if (value is Alignment) {
      emit(NewStackAlignState.fromOldSettingState(state, alignment: value));
    }

    if (value is TextDirection) {
      emit(NewStackAlignState.fromOldSettingState(state, textDirection: value));
    }

    if (value is StackFit) {
      emit(NewStackAlignState.fromOldSettingState(state, stackFit: value));
    }

    if (value is Clip) {
      emit(NewStackAlignState.fromOldSettingState(state, clip: value));
    }
  }
}
