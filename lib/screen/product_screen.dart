import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/cart_cubit/cart_cubit.dart';
import 'package:online_store/cubits/cart_cubit/cart_state.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_state.dart';
import 'package:online_store/cubits/product_cubits/product_cubits.dart';
import 'package:online_store/cubits/product_cubits/product_state.dart';
import 'package:online_store/widget/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubits>(context).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is AddToFavoritesSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Added to favorites')));
            } else if (state is AddToFavoritesFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to add to favorites')),
              );
            }
          },
        ),
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddToCartsSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Added to cart')));
            } else if (state is AddToCartsFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Failed to add to cart')));
            }else{
                  ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Product Already In Cart')));
            }
          },
        ),
      ],
      child: BlocBuilder<ProductCubits, ProductState>(
        builder: (context, state) {
          if (state is LoadingProducts) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetProductsSuccessfullyState) {
            final product =
                BlocProvider.of<ProductCubits>(context).productModel;
            return GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
              ),
              children: List.generate(product.length, (index) {
                final int user_id = int.parse(
                  "${BlocProvider.of<AuthUserCubit>(context).userModel.user_id}",
                );
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: ProductCard(
                    product: product[index],
                    user_id: user_id,
                    icon: Icons.favorite,
                    onFavoritePressed: () {
                      context.read<FavoriteCubit>().addFavoriteProduct(
                        user_id: user_id,
                        product_id: product[index].product_id,
                      );
                    },
                    onCartPressed: () {
                      context.read<CartCubit>().addCartProducts(
                        user_id: user_id,
                        product_id: product[index].product_id,
                      );
                    },
                  ),
                );
              }),
            );
          } else {
            return Text('There are no products currently available.');
          }
        },
      ),
    );
  }
}
