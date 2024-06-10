import 'package:flutter_bloc/flutter_bloc.dart';

import 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityInitial());

  void increaseQuantity(int qty, double price, int maxQty) {
    final newQuantity = qty + 1;
    if (newQuantity <= maxQty) {
      final newPrice = calculatePrice(newQuantity, price);
      emit(QuantityUpdatedState(newQuantity, newPrice, maxQty));
    }
  }

  void decreaseQuantity(int qty, double price, int maxQty) {
    final newQuantity = qty - 1;
    if (newQuantity >= 1) {
      final newPrice = calculatePrice(newQuantity, price);
      emit(QuantityUpdatedState(newQuantity, newPrice, maxQty));
    }
  }

  double calculatePrice(int quantity, double price) {
    return price * quantity;
  }
}
