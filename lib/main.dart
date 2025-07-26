import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_store/cubits/auth_cubits/auth_cubits.dart';
import 'package:online_store/cubits/product_cubits/product_cubits.dart';
import 'package:online_store/screen/auth/login_screen.dart';
import 'package:online_store/screen/home_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthUserCubit()),
        BlocProvider(create: (context) => ProductCubits()),
      ],

      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
