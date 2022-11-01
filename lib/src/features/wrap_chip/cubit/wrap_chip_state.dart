part of 'wrap_chip_cubit.dart';

abstract class WrapChipState extends Equatable {
  const WrapChipState({
    required this.elevation,
    required this.deleteIconFunc,
    required this.spacing,
    required this.avatar,
    required this.shape,
    // required this.stadium,
    required this.runSpacing,
  });

  final double elevation;
  final bool? deleteIconFunc;
  final double spacing;
  final Icon? avatar;
  final OutlinedBorder? shape;
  // final stadium;
  final double runSpacing;

  @override
  List<Object?> get props =>
      [elevation, deleteIconFunc, spacing, avatar, runSpacing, shape];
}

class WrapChipInitial extends WrapChipState {
  const WrapChipInitial({
    required super.elevation,
    required super.deleteIconFunc,
    required super.spacing,
    required super.avatar,
    required super.shape,
    // required this.stadium,
    required super.runSpacing,
  });
}

class NewWrapChipState extends WrapChipState {
  NewWrapChipState.fromOldSettingState(
    WrapChipState oldState, {
    double? elevation,
    bool? deleteIconFunc,
    double? spacing,
    Icon? avatar,
    OutlinedBorder? shape,
    // final stadium;
    double? runSpacing,
  }) : super(
          elevation: elevation ?? oldState.elevation,
          shape: shape ?? oldState.shape,
          deleteIconFunc: deleteIconFunc,
          spacing: spacing ?? oldState.spacing,
          avatar: avatar,
          runSpacing: runSpacing ?? oldState.runSpacing,
        );
}
