abstract class QuantityState {}

class QuantityInitial extends QuantityState {}


class QuantityUpdatedState extends QuantityState {
  final int quantity;
  final double price;
  final int maxQuantity;

  QuantityUpdatedState(this.quantity, this.price, this.maxQuantity);
}
