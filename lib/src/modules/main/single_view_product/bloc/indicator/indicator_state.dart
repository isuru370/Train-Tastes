part of 'indicator_cubit.dart';

@immutable
sealed class DotIndicatorState {}

final class DotIndicatorInitial extends DotIndicatorState {}

final class DotIndicatorUpdateState extends DotIndicatorState {
  final int index;
  DotIndicatorUpdateState(this.index);
}

final class ScreenUpdateState extends DotIndicatorState {
  final int currentIndex;
  ScreenUpdateState(this.currentIndex);
}
