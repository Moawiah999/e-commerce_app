import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_state.dart';
import 'package:online_store/widget/custom_text_field.dart';
import 'package:online_store/widget/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void getFavoriteProduct() {
    final id = BlocProvider.of<AuthUserCubit>(context).userModel.user_id;

    BlocProvider.of<FavoriteCubit>(context).getFavoriteProduct(user_id: id);
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
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is RemoveFromFavoritesSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'product has  successfully removed from favorites',
                ),
              ),
            );
          } else if (state is RemoveFromFavoritesFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to remove product from favorites'),
              ),
            );
          }
        },
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
                        return ProductCard(
                          product: products[index],
                          user_id:
                              BlocProvider.of<AuthUserCubit>(
                                context,
                              ).userModel.user_id,
                          icon: Icons.delete,
                          onPressed: () {
                            BlocProvider.of<FavoriteCubit>(
                              context,
                            ).deleteFavoriteProduct(
                              user_id:
                                  BlocProvider.of<AuthUserCubit>(
                                    context,
                                  ).userModel.user_id,
                              product_id: products[index].product_id,
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NoFavoriteProducts) {
            return Center(child: Text('There are no favorite products yet.'));
          } else {
            return Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}
