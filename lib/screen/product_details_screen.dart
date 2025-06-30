import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

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
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Container(
              height: 450,
              child: Image.network(
                fit: BoxFit.fill,
                'https://tmlewin.co.uk/cdn/shop/files/Crewneck_Tshirt_Black_67937_FLF.jpg?v=1727366656',
              ),
            ),

            Text(
              'black t-shirt',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            ),
            SizedBox(height: 10),

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Color : "),
                Spacer(flex: 2),
                Container(
                  width: 25,
                  height: 25,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: 25,
                  height: 25,

                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: 25,
                  height: 25,

                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: 25,
                  height: 25,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Size : "),
                Spacer(flex: 2),
                Text("4"),
                Spacer(flex: 1),
                Text("5"),
                Spacer(flex: 1),
                Text("6"),
                Spacer(flex: 1),
                Text("6"),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
