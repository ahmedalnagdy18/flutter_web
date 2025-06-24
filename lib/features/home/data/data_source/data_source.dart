import 'dart:convert';

import 'package:flutter_website/features/home/data/mapper/product_mapper.dart';
import 'package:flutter_website/features/home/data/model/api_product_model.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<List<ProductModel>> fetchdata() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<ProductModel> getData = [];
      for (var element in data['products']) {
        ApiProductModel apiModel = ApiProductModel.fromJson(element);
        getData.add(apiModel.productMap());
      }
      return getData;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
