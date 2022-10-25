part of 'stack_align_cubit.dart';

abstract class StackAlignState extends Equatable {
  const StackAlignState({
    required this.alignment,
    required this.clip,
    required this.stackFit,
    required this.textDirection,
  });
  final Alignment alignment;
  final TextDirection textDirection;
  final StackFit stackFit;
  final Clip clip;

  @override
  List<Object> get props => [
        alignment,
        stackFit,
        textDirection,
        clip,
      ];
}

class StackAlignInitial extends StackAlignState {
  const StackAlignInitial({
    required super.alignment,
    required super.clip,
    required super.stackFit,
    required super.textDirection,
  });
}

class NewStackAlignState extends StackAlignState {
  NewStackAlignState.fromOldSettingState(StackAlignState oldState,
      {Alignment? alignment,
      TextDirection? textDirection,
      StackFit? stackFit,
      Clip? clip})
      : super(
          alignment: alignment ?? oldState.alignment,
          textDirection: textDirection ?? oldState.textDirection,
          stackFit: stackFit ?? oldState.stackFit,
          clip: clip ?? oldState.clip,
        );
}
