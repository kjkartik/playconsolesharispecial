import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';
import 'full_page_shari.dart';
import 'long_shari.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartik',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: FirstPage(),
    );
  }
}
