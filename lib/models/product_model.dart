class ProductModel {
  String product_name;
  String product_image;
  int price_product;

  ProductModel({
    required this.product_name,
    required this.product_image,
    required this.price_product,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      product_name: json['product_name'],
      product_image: json['product_image'],
      price_product: json['price_product'],
    );
  }
}
