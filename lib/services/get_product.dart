import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/models/product_model.dart';

class GetProduct {
  final Dio dio;
  GetProduct(this.dio);
  Future getProduct() async {
    try {
      Response response = await Dio().get(
        "http://${dotenv.env['url']}:5000/products",
      );
      List<dynamic> data = response.data['data'];

      List<ProductModel> productList =
          data.map((item) => ProductModel.fromJson(item)).toList();

      return productList;
    } on Exception catch (e) {
      throw Exception('error');
    }
  }
}
