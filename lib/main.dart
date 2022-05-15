import 'package:flutter/material.dart';
import 'package:shop_project/signup_sginin_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,      
      home: SignUpLogin(),
    );
  }
}
