import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';

part 'add_to_card_state.dart';

class AddToCardCubit extends Cubit<AddToCardState> {
  AddToCardCubit() : super(CartState(cartItems: []));

  void addItemToCart(ProductModel item) {
    final currentState = state as CartState;
    final updatedCart = List<ProductModel>.from(currentState.cartItems)
      ..add(item);
    emit(CartState(cartItems: updatedCart));
  }

  void removeItemFromCart(ProductModel item) {
    final currentState = state as CartState;
    final updatedCart = List<ProductModel>.from(currentState.cartItems)
      ..remove(item);
    emit(CartState(cartItems: updatedCart));
  }
}
