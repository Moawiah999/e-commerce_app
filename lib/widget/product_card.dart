import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:online_store/cubits/favorite_cubit/favorite_state.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/screen/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.user_id,
    required this.icon,
    required this.onPressed,
  });

  final ProductModel product;
  final int user_id;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(widget.product.product_image);

    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is AddToFavoritesSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Added to favorites')));
        } else if (state is AddToFavoritesFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed to add to favorites')));
        }
      },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProductDetailsScreen(
                  product_name: widget.product.product_name,
                  product_image: widget.product.product_image,
                  information_product: widget.product.information_product,
                  price_product: widget.product.price_product,
                );
              },
            ),
          );
        },
        child: Card(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: 150,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: widget.onPressed, icon: Icon(widget.icon)),

                    Image.memory(imageBytes),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.product.product_name),
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(widget.product.price_product.toString()),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_sharp,
                    color: Colors.red,
                    size: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
