import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/product_cubits/product_cubits.dart';
import 'package:online_store/cubits/product_cubits/product_state.dart';
import 'package:online_store/screen/product_details_screen.dart';

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
    return BlocBuilder<ProductCubits, ProductState>(
      builder: (context, state) {
        if (state is LoadingProducts) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetProductsSuccessfullyState) {
          final product = BlocProvider.of<ProductCubits>(context).productModel;
          return GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            children: List.generate(product.length, (index) {
              Uint8List imageBytes = base64Decode(product[index].product_image);

              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsScreen();
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
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                ),
                                Image.memory(imageBytes),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(product[index].product_name),
                            ),
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            title: Text(
                              product[index].price_product.toString(),
                            ),
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
                ),
              );
            }),
          );
        } else {
          return Text('');
        }
      },
    );
  }
}
