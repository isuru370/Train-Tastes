import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../view/cart_screen.dart';

part 'cart_quantity_state.dart';

class CartQuantityCubit extends Cubit<CartQuantityState> {
  CartQuantityCubit() : super(CartQuantityInitial());

  void increaseQuantity(int qty, double price, Product products) {
    products.qty++;
    emit(CartQuantityUpdatedState(qty));
    //_calculateTotalPrice(products);
  }

  void decreaseQuantity(int qty, double price, Product products) {
    if (qty > 1) {
      qty--;
    }
    emit(CartQuantityUpdatedState(qty));
    //_calculateTotalPrice(products);
  }

  void _calculateTotalPrice(products) {
    double totalPrice =
        products.fold(0, (sum, item) => sum + item.price * item.qty);
    emit(CartProductTotalPriceState(totalPrice));
  }
}
