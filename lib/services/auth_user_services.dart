import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/models/user_model.dart';

class AuthUserServices {
  final Dio dio;

  AuthUserServices(this.dio);
  Future<UserModel> registrationUser({
    required username,
    required email,
    required password,
  }) async {
    try {
      Response response = await dio.post(
        'http://${dotenv.env['url']}:5000/users/register',
        data: {'username': username, 'email': email, 'password': password},
      );
      print(response.data);
      UserModel userModel = UserModel.fromJson(response.data['data']);

      return userModel;
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        throw Exception('Email already in use');
      }
      throw Exception('Failed to register user');
    }
  }

  Future<UserModel> loginUser({required email, required password}) async {
    try {
      Response response = await dio.post(
        'http://${dotenv.env['url']}:5000/users/login',
        data: {'email': email, 'password': password},
      );
      UserModel userModel = UserModel.fromJson(response.data['data']);

      return userModel;
    } on DioException catch (e) {
     
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid email or password');
      }
      throw Exception('Login failed');
    }
  }
}
