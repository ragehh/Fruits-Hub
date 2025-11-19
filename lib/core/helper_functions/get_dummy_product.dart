import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productName: 'Apple',
    productCode: '123',
    productDescription: 'Fresh apple',
    productPrice: 2.5,
    reviews: [],
    expirationMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
