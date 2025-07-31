import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/product_cubits/product_state.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/get_product_services.dart';

class ProductCubits extends Cubit<ProductState> {
  ProductCubits() : super(LoadingProducts());
  List<ProductModel> productModel = [];
  Future getProduct() async {
    try {
      emit(LoadingProducts());
      productModel = await GetProduct(Dio()).getProduct();

      emit(GetProductsSuccessfullyState());
    } catch (e) {
      emit(GetProductsFailedState());
    }
  }
}
