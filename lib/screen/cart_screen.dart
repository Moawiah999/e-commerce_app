import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$100'),
            ElevatedButton(onPressed: () {}, child: Text('Pay Now')),
          ],
        ),
      ),
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("My Cart")),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://tmlewin.co.uk/cdn/shop/files/Crewneck_Tshirt_Black_67937_FLF.jpg?v=1727366656',
                ),
              ),
              Column(
                children: [
                  Text('black t-shirt'),
                  Text("50\$"),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      Text("2"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          );
        },
      ),
    );
  }
}
