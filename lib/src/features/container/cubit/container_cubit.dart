import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';

part 'container_state.dart';

class ContainerCubit extends Cubit<ContainerState> implements ParentCubit {
  ContainerCubit()
      : super(ContainerInitial(
          background: AppColors.white,
          blendMode: BlendMode.src,
          border: const Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const BoxShadow(),
        ));

  @override
  void addNewEvent(value) {
    print(value);
    if (value is Color) {
      emit(NewContainerState.fromOldSettingState(state, background: value));
    }

    if (value is BlendMode) {
      emit(NewContainerState.fromOldSettingState(state, blendMode: value));
    }

    if (value is Border) {
      emit(NewContainerState.fromOldSettingState(state, border: value));
    }

    if (value is BorderRadius) {
      emit(NewContainerState.fromOldSettingState(state, borderRadius: value));
    }
    if (value is BoxShadow) {
      emit(NewContainerState.fromOldSettingState(state, boxShadow: value));
    }
  }
}
