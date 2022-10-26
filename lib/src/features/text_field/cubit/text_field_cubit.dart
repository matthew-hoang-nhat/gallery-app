import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_app/src/features/text_field/text_field_enum.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> implements ParentCubit {
  TextFieldCubit()
      : super(const TextFieldInitial(
          hintText: false,
          labelText: false,
          helpText: false,
          errorText: false,
          counterText: false,
          prefix: false,
          suffix: false,
          prefixIcon: false,
        ));

  @override
  void addNewEvent(value) {
    if (value == TextFieldEnum.hintText) {
      emit(NewTextFieldState.fromOldSettingState(state,
          hintText: !state.hintText));
    }
    if (value == TextFieldEnum.labelText) {
      emit(NewTextFieldState.fromOldSettingState(state,
          labelText: !state.labelText));
    }
    if (value == TextFieldEnum.helpText) {
      emit(NewTextFieldState.fromOldSettingState(state,
          helpText: !state.helpText));
    }
    if (value == TextFieldEnum.errorText) {
      emit(NewTextFieldState.fromOldSettingState(state,
          errorText: !state.errorText));
    }
    if (value == TextFieldEnum.counterText) {
      emit(NewTextFieldState.fromOldSettingState(state,
          counterText: !state.counterText));
    }
    if (value == TextFieldEnum.prefix) {
      emit(NewTextFieldState.fromOldSettingState(state, prefix: !state.prefix));
    }
    if (value == TextFieldEnum.suffix) {
      emit(NewTextFieldState.fromOldSettingState(state, suffix: !state.suffix));
    }
    if (value == TextFieldEnum.prefixIcon) {
      emit(NewTextFieldState.fromOldSettingState(state,
          prefixIcon: !state.prefixIcon));
    }
  }
}
