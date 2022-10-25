part of 'row_column_cubit.dart';

abstract class RowColumnState extends Equatable {
  const RowColumnState({
    required this.isColumn,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.textBaseline,
    required this.mainAxisSize,
    required this.textDirection,
    required this.verticalDirection,
  });
  final bool isColumn;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextBaseline textBaseline;
  final MainAxisSize mainAxisSize;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  @override
  List<Object> get props => [
        isColumn,
        mainAxisAlignment,
        crossAxisAlignment,
        textBaseline,
        mainAxisSize,
        textDirection,
        verticalDirection
      ];
}

class RowColumnInitial extends RowColumnState {
  const RowColumnInitial({
    required super.isColumn,
    required super.mainAxisAlignment,
    required super.crossAxisAlignment,
    required super.mainAxisSize,
    required super.textBaseline,
    required super.textDirection,
    required super.verticalDirection,
  });
}

class NewSettingState extends RowColumnState {
  NewSettingState.fromOldSettingState(
    RowColumnState oldState, {
    bool? isColumn,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    TextBaseline? textBaseline,
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
  }) : super(
          isColumn: isColumn ?? oldState.isColumn,
          mainAxisAlignment: mainAxisAlignment ?? oldState.mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment ?? oldState.crossAxisAlignment,
          mainAxisSize: mainAxisSize ?? oldState.mainAxisSize,
          textBaseline: textBaseline ?? oldState.textBaseline,
          textDirection: textDirection ?? oldState.textDirection,
          verticalDirection: verticalDirection ?? oldState.verticalDirection,
        );
}
