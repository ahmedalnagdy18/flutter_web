import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/domain/usecase/product_usecase.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUsecase usecase;
  ProductCubit({required this.usecase}) : super(ProductInitial());

  Future<void> getProducts() async {
    try {
      final response = await usecase.call();

      if (response.isNotEmpty) {
        emit(SucsessProducts(response));
      }
    } catch (e) {
      emit(ErrorProducts('no data found'));
    }
  }
}
