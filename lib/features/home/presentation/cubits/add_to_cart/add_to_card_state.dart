part of 'add_to_card_cubit.dart';

sealed class AddToCardState extends Equatable {
  @override
  List<Object?> get props => [];

  const AddToCardState();
}

final class AddToCardInitial extends AddToCardState {}

class ProductInitial extends AddToCardState {}

class CartState extends AddToCardState {
  final List<ProductModel> cartItems;

  const CartState({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}
