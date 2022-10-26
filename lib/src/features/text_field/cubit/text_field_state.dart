part of 'text_field_cubit.dart';

abstract class TextFieldState extends Equatable {
  const TextFieldState({
    required this.hintText,
    required this.labelText,
    required this.helpText,
    required this.errorText,
    required this.counterText,
    required this.prefix,
    required this.suffix,
    required this.prefixIcon,
  });
  final bool hintText;
  final bool labelText;
  final bool helpText;
  final bool errorText;
  final bool counterText;
  final bool prefix;
  final bool suffix;
  final bool prefixIcon;

  @override
  List<Object> get props => [
        hintText,
        labelText,
        helpText,
        errorText,
        counterText,
        prefix,
        suffix,
        prefixIcon
      ];
}

class TextFieldInitial extends TextFieldState {
  const TextFieldInitial({
    required super.hintText,
    required super.labelText,
    required super.helpText,
    required super.errorText,
    required super.counterText,
    required super.prefix,
    required super.suffix,
    required super.prefixIcon,
  });
}

class NewTextFieldState extends TextFieldState {
  NewTextFieldState.fromOldSettingState(
    TextFieldState oldState, {
    bool? hintText,
    bool? labelText,
    bool? helpText,
    bool? errorText,
    bool? counterText,
    bool? prefix,
    bool? suffix,
    bool? prefixIcon,
  }) : super(
          hintText: hintText ?? oldState.hintText,
          labelText: labelText ?? oldState.labelText,
          helpText: helpText ?? oldState.helpText,
          errorText: errorText ?? oldState.errorText,
          counterText: counterText ?? oldState.counterText,
          prefix: prefix ?? oldState.prefix,
          suffix: suffix ?? oldState.suffix,
          prefixIcon: prefixIcon ?? oldState.prefixIcon,
        );
}
