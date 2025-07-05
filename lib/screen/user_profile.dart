import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("user infoe")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/20787/pexels-photo.jpg',
                ),
                radius: 120,
              ),
            ),
            Spacer(flex: 1),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('update info')),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
