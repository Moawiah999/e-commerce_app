import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/models/product_model.dart';

class GetFavoriteProductServices {
  final Dio dio;
  GetFavoriteProductServices(this.dio);
  Future getFavoriteProduct({
    required int user_id,
    
  }) async {
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
}
