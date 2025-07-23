import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/auth_cubits/auth_user_state.dart';
import 'package:online_store/screen/home_screen.dart';
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthUserCubit, AuthUserState>(
      listener: (context, state) {
        if (state is UserRegistrationSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
        } else if (state is UserRegistrationFailedState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Registration failed')));
        } else if (state is UserExistsState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Email already in use')));
        }
      },

      child: Scaffold(
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
                onPressed: () {
                  BlocProvider.of<AuthUserCubit>(context).registration(
                    username: username.text,
                    email: email.text,
                    password: password.text,
                  );
                },
                child: Text('Registration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
