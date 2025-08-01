import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_state.dart';
import 'package:online_store/widget/custom_text_field.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void getFavoriteProduct() {
    final id = BlocProvider.of<AuthUserCubit>(context).userModel.user_id;
    print("id $id");
    BlocProvider.of<FavoriteCubit>(
      context,
    ).getFavoriteProduct(user_id: int.parse('${id}'));
  }

  @override
  void initState() {
    super.initState();
    getFavoriteProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavoriteProductsLoaded) {
            final products =
                BlocProvider.of<FavoriteCubit>(context).productModel;
            return Padding(
              padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Search for products',
                    icon: Icons.search,
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                      ),
                      children: List.generate(products.length, (index) {
                        Uint8List imageBytes = base64Decode(
                          products[index].product_image,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                            bottom: 5,
                          ),
                          child: Card(
                            child: ListView(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 150,
                                  height: 100,
                                  child: Image.memory(imageBytes),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(products[index].product_name),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ListTile(
                                  title: Text(
                                    "${products[index].price_product}\$",
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 27,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('There are no favorite products yet.'));
          }
        },
      ),
    );
  }
}
