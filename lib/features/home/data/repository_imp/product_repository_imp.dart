import 'package:flutter_website/features/home/data/data_source/data_source.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImp({required this.remoteDataSource});
  @override
  Future<List<ProductModel>> getdata() async {
    try {
      return await remoteDataSource.fetchdata();
    } catch (e) {
      rethrow;
    }
  }
}
