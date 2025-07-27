import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product_name,
    required this.product_image,
    required this.information_product,
    required this.price_product,
  });
  final String product_name;
  final String product_image;
  final int price_product;
  final String information_product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(widget.product_image);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${widget.price_product}'),
            ElevatedButton(onPressed: () {}, child: Text('Pay Now')),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Container(
              height: 450,
              child: Image.memory(fit: BoxFit.fill, imageBytes),
            ),

            Text(
              widget.product_name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(widget.information_product),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
