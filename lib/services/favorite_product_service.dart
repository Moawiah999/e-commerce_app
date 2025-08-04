import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/models/product_model.dart';

class FavoriteProductService {
  final Dio dio;
  FavoriteProductService(this.dio);
  Future getFavoriteProduct({required int user_id}) async {
    try {
      Response response = await Dio().get(
        'http://${dotenv.env['url']}:5000/favorites/${user_id}',
      );
      List<dynamic> data = response.data['data'];

      List<ProductModel> productList =
          data.map((item) => ProductModel.fromJson(item)).toList();

      return productList;
    } on Exception catch (e) {
      throw Exception('error ${e.toString()}');
    }
  }

  Future addFavoriteProduct({
    required int user_id,
    required int product_id,
  }) async {
    try {
      Response response = await Dio().post(
        'http://${dotenv.env['url']}:5000/favorites/add/${user_id}/${product_id}',
      );
      dynamic data = response.data;
      print(data);
    } on Exception catch (e) {
      throw Exception('error addFavoriteProduct ${e.toString()}');
    }
  }
}
