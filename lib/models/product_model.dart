class ProductModel {
  String product_name;
  String product_image;
  String information_product;
  int price_product;
  int product_id;

  ProductModel({
    required this.product_name,
    required this.product_image,
    required this.price_product,
    required this.product_id,
    required this.information_product,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      product_name: json['product_name'],
      product_image: json['product_image'],
      price_product: json['price_product'],
      product_id: json['id'],
      information_product: json['information_product'],
    );
  }
}
