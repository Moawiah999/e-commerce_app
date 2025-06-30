import 'package:flutter/material.dart';
import 'package:online_store/screen/cart_screen.dart';
import 'package:online_store/screen/favorite_screen.dart';
import 'package:online_store/screen/orders_history.dart';
import 'package:online_store/screen/user_profile.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.home),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FavoriteScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CartScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return OrdersHistory();
                  },
                ),
              );
            },
            icon: Icon(Icons.receipt_long),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return UserProfile();
                  },
                ),
              );
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
