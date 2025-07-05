import 'package:flutter/material.dart';
import 'package:online_store/screen/auth/login_form_screen.dart';
import 'package:online_store/screen/auth/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Tab(child: Text('Login')), Tab(child: Text('Register'))],
          ),
        ),
        body: const TabBarView(
          children: [LoginFormScreen(), RegistrationScreen()],
        ),
      ),
    );
  }
}
