import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/cart_cubit/cart_state.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/cart_product_services.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartProductsLoading());
  List<ProductModel> productModel = [];
  Future getCartProduct({required int user_id}) async {
    try {
      emit(CartProductsLoading());
      productModel = await CartProductServices(
        Dio(),
      ).getCartProduct(user_id: user_id);
      if (productModel.isEmpty) {
        emit(NoCartProducts());
      } else {
        emit(CartProductsLoaded());
      }
    } catch (e) {
      print('object Error CartCubit');
      print(e.toString());
      emit(CartProductsLoadFailed());
    }
  }

  Future addCartProducts({
    required int user_id,
    required int product_id,
  }) async {
    try {
      final alreadyInCart = productModel.any((p) => p.product_id == product_id);
      if (alreadyInCart) {
        emit(ProductAlreadyInCart());
      } else {
        await CartProductServices(
          Dio(),
        ).addCartProducts(user_id: user_id, product_id: product_id);
        emit(AddToCartsSuccess());
        getCartProduct(user_id: user_id);
      }
    } catch (e) {
      print('===================');
      emit(AddToCartsFailure());
    }
  }

  Future deleteCartProduct({
    required int user_id,
    required int product_id,
  }) async {
    try {
      await CartProductServices(
        Dio(),
      ).deleteCartProduct(user_id: user_id, product_id: product_id);
      emit(RemoveFromCartsSuccess());
      getCartProduct(user_id: user_id);
    } catch (e) {
      emit(RemoveFromCartsFailure());
    }
  }
}
