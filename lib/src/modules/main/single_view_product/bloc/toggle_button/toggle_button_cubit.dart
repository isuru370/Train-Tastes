import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_button_state.dart';

class ToggleButtonCubit extends Cubit<ToggleButtonState> {
  ToggleButtonCubit() : super(ToggleButtonInitial());

  void foodShopVisible(bool isVisible) {
    if (isVisible) {
      isVisible = false;
      emit(FoodShopVisibleState(isVisible));
    } else {
      isVisible = true;
      emit(FoodShopVisibleState(isVisible));
    }
  }
}
