part of 'cart_quantity_cubit.dart';

sealed class CartQuantityState extends Equatable {
  const CartQuantityState();

  @override
  List<Object> get props => [];
}

final class CartQuantityInitial extends CartQuantityState {}

class CartQuantityUpdatedState extends CartQuantityState {
  final int qty;

  const CartQuantityUpdatedState(this.qty);
}

class CartProductTotalPriceState extends CartQuantityState {
  final double totalPrice;

  const CartProductTotalPriceState(this.totalPrice);
}
