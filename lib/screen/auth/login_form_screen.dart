import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/auth_cubits/auth_user_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthUserCubit, AuthUserState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
        } else if (state is UserDoesNotExist) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This account does not exist')),
          );
        } else if (state is UserInformationErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Invalid email or password')));
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('The login process failed.')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(hintText: 'email', controller: email),
            SizedBox(height: 20),
            CustomTextField(hintText: 'password', controller: password),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthUserCubit>(
                  context,
                ).login(email: email.text, password: password.text);
              },
              child: Text('login'),
            ),
          ],
        ),
      ),
    );
  }
}
