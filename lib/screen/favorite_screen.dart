import 'package:flutter/material.dart';
import 'package:online_store/widget/custom_text_field.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
        child: Column(
          children: [
            CustomTextField(hintText: 'Search for products',),
            SizedBox(height: 15),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                children: List.generate(3, (index) {
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
                              child: Image.network(
                                'https://tmlewin.co.uk/cdn/shop/files/Crewneck_Tshirt_Black_67937_FLF.jpg?v=1727366656',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Tshirt_Black"),
                              ),
                            ),
                            SizedBox(height: 10,),
                            ListTile(
                              title: Text("50\$"),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.red,size: 27,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
