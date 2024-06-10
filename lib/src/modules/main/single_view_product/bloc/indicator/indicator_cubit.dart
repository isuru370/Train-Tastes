import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indicator_state.dart';

class DotIndicatorCubit extends Cubit<DotIndicatorState> {
  DotIndicatorCubit() : super(DotIndicatorInitial());

  void updateImageIndex(int index) {
    emit(DotIndicatorUpdateState(index));
  }

  void updateScreen(int index) {
    emit(ScreenUpdateState(index));
  }
}
