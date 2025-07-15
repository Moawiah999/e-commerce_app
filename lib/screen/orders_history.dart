import 'package:flutter/material.dart';

class OrdersHistory extends StatelessWidget {
  const OrdersHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders History')),
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
                children: [Text('black t-shirt'), Text("50\$"), Text("2")],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.autorenew, color: Colors.red),
              ),
            ],
          );
        },
      ),
    );
  }
}
