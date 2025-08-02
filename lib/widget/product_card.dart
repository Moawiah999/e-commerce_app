import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/screen/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product,required this.user_id});

  final ProductModel product;
  final int user_id;

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(product.product_image);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsScreen(
                product_name: product.product_name,
                product_image: product.product_image,
                information_product: product.information_product,
                price_product: product.price_product,
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  Image.memory(imageBytes),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(product.product_name),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(product.price_product.toString()),
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
    );
  }
}
