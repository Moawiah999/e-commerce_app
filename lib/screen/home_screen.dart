import 'package:flutter/material.dart';
import 'package:online_store/widget/bottom_navigation_bar.dart';
import 'package:online_store/widget/search_text_field.dart';

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
              SearchTextField(),
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
              GridView(
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
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
