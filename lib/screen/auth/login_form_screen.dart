
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/widget/custom_text_field.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(hintText: 'email', controller: email),
          SizedBox(height: 20),
          CustomTextField(hintText: 'password', controller: password),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                await dio.post(
                  'http://${dotenv.env['url']}:5000/users/register',
                  data: {"email": email.text, "password": password.text},
                );
              } catch (e) {
                print('error');
              }
            },
            child: Text('login'),
          ),
        ],
      ),
    );
  }
}
