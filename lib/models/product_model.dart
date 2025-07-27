class ProductModel {
  String product_name;
  String product_image;
  String information_product;
  int price_product;
  int id_product;

  ProductModel({
    required this.product_name,
    required this.product_image,
    required this.price_product,
    required this.id_product,
    required this.information_product,
  });
  factory ProductModel.fromJson(json) {
    return ProductModel(
      product_name: json['product_name'],
      product_image: json['product_image'],
      price_product: json['price_product'],
      id_product: json['id'],
      information_product: json['information_product'],
    );
  }
}
