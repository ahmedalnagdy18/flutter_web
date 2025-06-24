part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

class LoadingProducts extends ProductState {}

class SucsessProducts extends ProductState {
  final List<ProductModel> posts;

  const SucsessProducts(this.posts);
}

class ErrorProducts extends ProductState {
  final String message;

  const ErrorProducts(this.message);
}
