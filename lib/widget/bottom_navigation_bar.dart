import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/cart_cubit/cart_cubit.dart';
import 'package:online_store/cubits/cart_cubit/cart_state.dart';
import 'package:online_store/screen/cart_screen.dart';
import 'package:online_store/screen/favorite_screen.dart';
import 'package:online_store/screen/orders_history.dart';
import 'package:online_store/screen/profile_screen.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // int cartItemCount = BlocProvider.of<CartCubit>(context).productModel.length;

    return BlocBuilder<CartCubit, CartState>(
      
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();
      final cartItemCount = cartCubit.productModel.length;
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
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_cart),
                    if (cartItemCount > 0)
                      Positioned(
                        right: -6,
                        top: -6,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$cartItemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
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
      },
    );
  }
}
