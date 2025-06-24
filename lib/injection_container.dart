import 'package:flutter_website/features/home/data/data_source/data_source.dart';
import 'package:flutter_website/features/home/data/repository_imp/product_repository_imp.dart';
import 'package:flutter_website/features/home/domain/repository/product_repository.dart';
import 'package:flutter_website/features/home/domain/usecase/product_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Usecases

  sl.registerLazySingleton<ProductUsecase>(
      () => ProductUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImp(remoteDataSource: sl()));

// DataSource

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
}
