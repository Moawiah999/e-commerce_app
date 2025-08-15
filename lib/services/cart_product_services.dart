import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/models/product_model.dart';

class CartProductServices {
  final Dio dio;

  CartProductServices(this.dio);
  Future getCartProduct({required int user_id}) async {
    try {
      Response response = await dio.get(
        'http://${dotenv.env['url']}:5000/cart/${user_id}',
      );
      List<dynamic> data = response.data['data'];
      List<ProductModel> cartList =
          data.map((item) => ProductModel.fromJson(item)).toList();

      return cartList;
    } catch (e) {
      print('error $e');
    }
  }

  Future addCartProducts({
    required int user_id,
    required int product_id,
  }) async {
    try {
      Response response = await Dio().post(
        'http://${dotenv.env['url']}:5000/cart/add/${user_id}/${product_id}',
        data: {"number_products": 1},
      );
      print('================response==============');
      print(response);
    } catch (e) {
      print('error $e');
    }
  }

  Future deleteCartProduct({
    required int user_id,
    required int product_id,
  }) async {
    try {
      Response response = await Dio().delete(
        'http://${dotenv.env['url']}:5000/cart/delete/${user_id}/${product_id}',
      );
      print(response.data);
    } catch (e) {
      print('error ${e.toString()}');
    }
  }
}
