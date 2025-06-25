part of 'add_to_card_cubit.dart';

sealed class AddToCardState extends Equatable {
  const AddToCardState();

  @override
  List<Object> get props => [];
}

final class AddToCardInitial extends AddToCardState {}

class ProductInitial extends AddToCardState {}

class CartState extends AddToCardState {
  final List<ProductModel> cartItems;

  const CartState({required this.cartItems});
}
