import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_and_signup/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: GoogleFonts.lato().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),

    );
  }
}