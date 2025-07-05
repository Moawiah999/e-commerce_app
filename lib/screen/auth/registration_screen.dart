import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/widget/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final dio = Dio();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hintText: 'user name', controller: username),
            SizedBox(height: 20),
            CustomTextField(hintText: 'email', controller: email),
            SizedBox(height: 20),
            CustomTextField(hintText: 'password', controller: password),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await dio.post(
                    'http://${dotenv.env['url']}:5000/users/register',
                    data: {
                      "username": username.text,
                      "email": email.text,
                      "password": password.text,
                    },
                  );
                }  catch (e) {
                  print('error');
                }
              },
              child: Text('Registration'),
            ),
          ],
        ),
      ),
    );
  }
}
