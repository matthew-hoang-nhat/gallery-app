import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_app/src/features/wrap_chip/screens/wrap_chip_screen.dart';

part 'wrap_chip_state.dart';

enum WrapChipEnum {
  elevation,
  deleteIcon,
  spacing,
  avatar,
  stadium,
  runSpacing,
}

class WrapChipCubit extends Cubit<WrapChipState> implements ParentCubit {
  WrapChipCubit()
      : super(const WrapChipInitial(
          avatar: null,
          deleteIconFunc: null,
          elevation: 0,
          runSpacing: 0,
          shape: null,
          spacing: 0,
        ));

  @override
  void addNewEvent(value) {
    final shapes = {
      ShapeEnum.rectangle:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ShapeEnum.square: const RoundedRectangleBorder(),
      ShapeEnum.meDefault: null,
    };

    if (value is ShapeEnum) {
      emit(NewWrapChipState.fromOldSettingState(state, shape: shapes[value]));
    }
    switch (value) {
      case WrapChipEnum.avatar:
        emit(NewWrapChipState.fromOldSettingState(state,
            deleteIconFunc: state.deleteIconFunc,
            avatar: state.avatar == null
                ? const Icon(CupertinoIcons.person)
                : null));
        break;
      case WrapChipEnum.deleteIcon:
        emit(NewWrapChipState.fromOldSettingState(state,
            avatar: state.avatar,
            deleteIconFunc: state.deleteIconFunc == null ? true : null));
        break;

      case WrapChipEnum.spacing:
        emit(NewWrapChipState.fromOldSettingState(
          state,
          avatar: state.avatar,
          deleteIconFunc: state.deleteIconFunc,
          spacing: state.spacing == 0 ? 20 : 0,
        ));
        break;
      case WrapChipEnum.elevation:
        emit(NewWrapChipState.fromOldSettingState(state,
            avatar: state.avatar,
            deleteIconFunc: state.deleteIconFunc,
            elevation: state.elevation == 0 ? 20 : 0));
        break;
      case WrapChipEnum.runSpacing:
        emit(NewWrapChipState.fromOldSettingState(state,
            avatar: state.avatar,
            deleteIconFunc: state.deleteIconFunc,
            runSpacing: state.runSpacing == 0 ? 20 : 0));
        break;
    }
  }
}
