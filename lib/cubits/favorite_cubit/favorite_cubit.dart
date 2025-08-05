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

  Future addFavoriteProduct({
    required int user_id,
    required int product_id,
  }) async {
    try {
      await FavoriteProductService(
        Dio(),
      ).addFavoriteProduct(user_id: user_id, product_id: product_id);
      emit(AddToFavoritesSuccess());
      print('favoriteProduct');
    } catch (e) {
      emit(AddToFavoritesFailure());
      print('-----------addFavoriteProductCubit=============');
      print('Error: $e');
    }
  }

  Future deleteFavoriteProduct({
    required int user_id,
    required int product_id,
  }) async {
    try {
      await FavoriteProductService(
        Dio(),
      ).deleteFavoriteProduct(user_id: user_id, product_id: product_id);
      emit(RemoveFromFavoritesSuccess());
      await getFavoriteProduct(user_id: user_id);
    } catch (e) {
      print('deleteFavoriteProduct ${e.toString()}');
      emit(RemoveFromFavoritesFailure());
    }
  }
}
