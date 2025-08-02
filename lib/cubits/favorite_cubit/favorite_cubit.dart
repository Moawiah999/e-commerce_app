import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_state.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/favorite_product_service.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteProductsLoading());

  List<ProductModel> productModel = [];

  Future getFavoriteProduct({required int user_id}) async {
    print('getFavoriteProduct');
    try {
      emit(FavoriteProductsLoading());

      productModel = await FavoriteProductService(
        Dio(),
      ).getFavoriteProduct(user_id: user_id);

      if (productModel.isEmpty) {
        emit(NoFavoriteProducts());
      } else {
        emit(FavoriteProductsLoaded());
      }
    } catch (e) {
      print('-----------=============');
      print('Error: $e');
      emit(FavoriteProductsLoadFailed());
    }
  }
}
