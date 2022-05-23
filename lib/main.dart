import 'package:flutter/material.dart';
import 'package:shop_project/signup_sginin_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCUhK8O1jPppoCLmhKxicjxT4z7w9M4DGI',
        appId: "1:260249009022:web:f020d164fb79e0ed92512f",
        messagingSenderId: "260249009022",
        projectId: "shop-project-auth",
        storageBucket: "shop-project-auth.appspot.com",
        androidClientId: "shop-project-auth.appspot.com",
        iosBundleId: 'com.example.shopProject',
        iosClientId: "260249009022-t7k9em1u8902du21ekp7f1p55dg62poi.apps.googleusercontent.com",
      ),
    );
  runApp(const MyApp());
}

class DefaultFirebaseOptions {
}

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
