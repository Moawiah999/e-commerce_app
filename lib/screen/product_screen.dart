import 'package:flutter/material.dart';
import 'package:online_store/screen/product_details_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 5,
          ),
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
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                          ),
                          Image.network(
                            'https://tmlewin.co.uk/cdn/shop/files/Crewneck_Tshirt_Black_67937_FLF.jpg?v=1727366656',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Tshirt_Black"),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("50\$"),
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
  }
}
