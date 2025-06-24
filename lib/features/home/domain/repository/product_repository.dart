import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getdata();
}
