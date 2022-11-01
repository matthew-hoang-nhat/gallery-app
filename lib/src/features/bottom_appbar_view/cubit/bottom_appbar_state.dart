part of 'bottom_appbar_cubit.dart';

abstract class BottomAppBarState extends Equatable {
  const BottomAppBarState({
    required this.isFloatActionButton,
    required this.floatingActionButtonLocation,
    required this.isNotchMargin,
  });

  final bool isFloatActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final bool isNotchMargin;

  @override
  List<Object?> get props => [
        isFloatActionButton,
        floatingActionButtonLocation,
        isNotchMargin,
      ];
}

class BottomAppBarInitial extends BottomAppBarState {
  const BottomAppBarInitial(
      {required super.isFloatActionButton,
      required super.floatingActionButtonLocation,
      required super.isNotchMargin});
}

class NewBottomAppBarState extends BottomAppBarState {
  NewBottomAppBarState.fromOldSettingState(
    BottomAppBarState oldState, {
    bool? isFloatActionButton,
    bool? isNotchMargin,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) : super(
          isNotchMargin: isNotchMargin ?? oldState.isNotchMargin,
          isFloatActionButton:
              isFloatActionButton ?? oldState.isFloatActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation ??
              oldState.floatingActionButtonLocation,
        );
}
