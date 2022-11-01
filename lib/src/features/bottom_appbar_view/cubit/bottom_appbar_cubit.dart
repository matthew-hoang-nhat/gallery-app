import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';

part 'bottom_appbar_state.dart';

enum BottomAppBarEnum { floatActionButton, notMargin }

class BottomAppBarCubit extends Cubit<BottomAppBarState>
    implements ParentCubit {
  BottomAppBarCubit()
      : super(const BottomAppBarInitial(
          isFloatActionButton: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          isNotchMargin: false,
        ));

  @override
  void addNewEvent(value) {
    if (value is BottomAppBarEnum) {
      switch (value) {
        case BottomAppBarEnum.floatActionButton:
          emit(NewBottomAppBarState.fromOldSettingState(
            state,
            isFloatActionButton: !state.isFloatActionButton,
          ));
          break;
        case BottomAppBarEnum.notMargin:
          emit(NewBottomAppBarState.fromOldSettingState(
            state,
            isNotchMargin: !state.isNotchMargin,
          ));
          break;
        default:
      }
    }

    if (value is FloatingActionButtonLocation) {
      emit(NewBottomAppBarState.fromOldSettingState(
        state,
        floatingActionButtonLocation: value,
      ));
    }
  }
}
