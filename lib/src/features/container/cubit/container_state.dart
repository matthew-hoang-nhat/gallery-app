part of 'container_cubit.dart';

abstract class ContainerState extends Equatable {
  const ContainerState({
    required this.border,
    required this.borderRadius,
    required this.boxShadow,
    required this.background,
    required this.blendMode,
  });
  final Border border;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;
  final Color background;
  final BlendMode blendMode;

  @override
  List<Object> get props =>
      [border, borderRadius, boxShadow, background, blendMode];
}

class ContainerInitial extends ContainerState {
  const ContainerInitial(
      {required super.background,
      required super.blendMode,
      required super.border,
      required super.borderRadius,
      required super.boxShadow});
}

class NewContainerState extends ContainerState {
  NewContainerState.fromOldSettingState(
    ContainerState oldState, {
    Border? border,
    BorderRadius? borderRadius,
    BoxShadow? boxShadow,
    Color? background,
    BlendMode? blendMode,
  }) : super(
          border: border ?? oldState.border,
          borderRadius: borderRadius ?? oldState.borderRadius,
          boxShadow: boxShadow ?? oldState.boxShadow,
          background: background ?? oldState.background,
          blendMode: blendMode ?? oldState.blendMode,
        );
}
