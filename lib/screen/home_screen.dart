import 'package:flutter/material.dart';
import 'package:online_store/screen/product_screen.dart';
import 'package:online_store/widget/bottom_navigation_bar.dart';
import 'package:online_store/widget/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Shop now'), Text('Your favorite products')],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/20787/pexels-photo.jpg',
              ),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Search for products',
                icon: Icons.search,
              ),
              SizedBox(height: 16),

              Container(
                height: 300,
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2020/11/13/23/49/christmas-5740350_1280.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('T-shirt'), Text('See All')],
              ),
              SizedBox(height: 16),
              ProductScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
