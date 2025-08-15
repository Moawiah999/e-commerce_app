import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/cart_cubit/cart_cubit.dart';
import 'package:online_store/cubits/cart_cubit/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final user_id;

  void getCartProduct() {
    user_id = BlocProvider.of<AuthUserCubit>(context).userModel.user_id;

    BlocProvider.of<CartCubit>(context).getCartProduct(user_id: user_id);
  }

  @override
  void initState() {
    super.initState();
    getCartProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$100'),
            ElevatedButton(onPressed: () {}, child: Text('Pay Now')),
          ],
        ),
      ),
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("My Cart")),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is RemoveFromCartsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('product has successfully removed from carts'),
              ),
            );
          } else if (state is RemoveFromCartsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to remove product from carts')),
            );
          }
        },
        builder: (context, state) {
          if (state is CartProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartProductsLoaded) {
            final products = BlocProvider.of<CartCubit>(context).productModel;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Uint8List imageBytes = base64Decode(
                  products[index].product_image,
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.memory(imageBytes),
                    ),
                    Column(
                      children: [
                        Text("${products[index].product_name}"),
                        Text("${products[index].price_product}\$"),
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            Text("${products[index].number_products}"),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CartCubit>(context).deleteCartProduct(
                          user_id: user_id,
                          product_id: products[index].product_id,
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                );
              },
            );
          } else if (state is NoCartProducts) {
            return Center(child: Text('There are no carts products yet.'));
          } else {
            return Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}
