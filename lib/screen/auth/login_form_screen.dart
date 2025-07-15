import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/screen/home_screen.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
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
                  isLoading = true;
                  setState(() {});
                  try {
                    var res = await dio.post(
                      'http://${dotenv.env['url']}:5000/users/login',
                      data: {"email": email.text, "password": password.text},
                    );
                    isLoading = false;
                    setState(() {});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } catch (e) {}
                },
                child: Text('login'),
              ),
            ],
          ),
        );
  }
}
