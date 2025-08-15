import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/screen/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.user_id,
    required this.icon,
    required this.onFavoritePressed,
    required this.onCartPressed,
  });

  final ProductModel product;
  final int user_id;
  final IconData icon;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCartPressed;
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(widget.product.product_image);

    return GestureDetector(
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
                  IconButton(
                    onPressed: widget.onFavoritePressed,
                    icon: Icon(widget.icon),
                  ),

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
                onPressed: widget.onCartPressed,
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
    );
  }
}
