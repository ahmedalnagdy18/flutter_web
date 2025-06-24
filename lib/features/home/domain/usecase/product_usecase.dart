import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/domain/repository/product_repository.dart';

class ProductUsecase {
  final ProductRepository repository;

  ProductUsecase({required this.repository});

  Future<List<ProductModel>> call() async {
    return await repository.getdata();
  }
}
