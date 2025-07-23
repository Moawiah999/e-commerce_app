import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/widget/custom_text_field.dart';

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
            CustomTextField(
              hintText:
                  '${BlocProvider.of<AuthUserCubit>(context).userModel.username}',
            ),

            SizedBox(height: 16),

            CustomTextField(
              hintText:
                  '${BlocProvider.of<AuthUserCubit>(context).userModel.email}',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print(
                  BlocProvider.of<AuthUserCubit>(context).userModel.username,
                );
              },
              child: Text('update info'),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
