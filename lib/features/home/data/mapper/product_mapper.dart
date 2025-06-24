import 'package:flutter_website/features/home/data/model/api_product_model.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';

extension ConvertProductModelToApiModel on ApiProductModel {
  ProductModel productMap() {
    return ProductModel(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      images: images,
      thumbnail: thumbnail,
    );
  }
}
