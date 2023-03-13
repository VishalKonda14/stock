import 'package:flutter/material.dart';
import 'package:validus/Authentications/LoginPage.dart';
// import 'package:validus/Screens/HomePage.dart';
// import 'package:validus/utils/Shared_pref.dart';

void main() {
  // await SharedPreferenceHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
