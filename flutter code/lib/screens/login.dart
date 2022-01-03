import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_and_signup/screens/HomeScreen.dart';
import 'package:login_and_signup/screens/signup.dart';
import 'package:login_and_signup/widgets/GF.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String username, password;

  Future login() async {
    if (_formKey.currentState!.validate()) {
      var url = Uri.parse("http://192.168.10.13/php/login.php");
      var response = await http.post(url, body: {
        "username": username,
        "password": password
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Fluttertoast.showToast(msg: "Username or Password incorrect");
      }
    }
  }

  toSignup (BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: "Log in".text.xl4.black.make(),
        leading: IconButton(
            onPressed: () {
              toSignup(context);
            },
            icon: Icon(CupertinoIcons.back),
            color: Colors.black,
          ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 50,),
            "Login with one of the options".text.xl.gray700.make(),
            SizedBox(height: 30,),
            GFWidget(),
            SizedBox(height: 50,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Email".text.size(17).black.bold.make().px8(),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "gaurav@gmail.com",
                      labelStyle: const TextStyle(
                        color: Colors.black
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.blueGrey
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.08),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.blueGrey
                        )
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email required";
                      }
                    },
                    onChanged: (value) {
                      username = value;
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  SizedBox(height: 10,),
                  "Password".text.size(17).black.bold.make().px8(),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "********",
                      labelStyle: const TextStyle(
                          color: Colors.black
                      ),
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1,
                            color: Colors.blueGrey
                        ),
                      ),
                      fillColor: Colors.blueGrey.withOpacity(0.08),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 0,
                            color: Colors.blueGrey
                        )
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Colors.black
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password required";
                      }
                    },
                    onChanged: (value) {
                      password = value;
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 50,),
                  Material(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () => login(),
                      child: AnimatedContainer (
                        duration: Duration(seconds: 1),
                        width: double.infinity,
                        height: 60,
                        alignment: Alignment.center,
                        child: "Log in".text.xl.blueGray100.bold.make(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Don't have an account?".text.gray400.bold.make().px(4),
                      InkWell(
                        onTap: () {toSignup(context);},
                        child: "Sign up".text.blueGray600.bold.make().px(4),
                      ),
                    ],
                  ),
                  SizedBox(height: 80,),
                ],
              )
            ).px(1),
          ],
        ).px(31),
      ),
    );
  }
}
