import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/app.dart';

part 'row_column_state.dart';

abstract class ParentCubit {
  void addNewEvent(dynamic);
}

class RowColumnCubit extends Cubit<RowColumnState> implements ParentCubit {
  RowColumnCubit()
      : super(const RowColumnInitial(
          isColumn: true,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textBaseline: TextBaseline.alphabetic,
          textDirection: TextDirection.ltr,
          verticalDirection: VerticalDirection.down,
        ));

  @override
  addNewEvent(value) {
    if (value is MainAxisAlignment) {
      emit(
          NewSettingState.fromOldSettingState(state, mainAxisAlignment: value));
    }
    if (value is CrossAxisAlignment) {
      emit(NewSettingState.fromOldSettingState(state,
          crossAxisAlignment: value));
    }
    while (getIt.allReadySync() != true) {}
    if (value is TextBaseline) {
      emit(NewSettingState.fromOldSettingState(state, textBaseline: value));
    }
    if (value is TextDirection) {
      emit(NewSettingState.fromOldSettingState(state, textDirection: value));
    }
    if (value is VerticalDirection) {
      emit(
          NewSettingState.fromOldSettingState(state, verticalDirection: value));
    }
    if (value is MainAxisSize) {
      emit(NewSettingState.fromOldSettingState(state, mainAxisSize: value));
    }
    if (value is bool) {
      emit(NewSettingState.fromOldSettingState(state, isColumn: value));
    }
  }
}
