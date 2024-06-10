part of 'toggle_button_cubit.dart';

@immutable
sealed class ToggleButtonState {}

final class ToggleButtonInitial extends ToggleButtonState {}

final class FoodShopVisibleState extends ToggleButtonState {
  final bool isFoodShop;
   FoodShopVisibleState(this.isFoodShop);
}
