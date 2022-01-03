import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_signup/screens/login.dart';
import 'package:login_and_signup/widgets/GF.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late String username, password;

  Future register() async {
    if (_formKey.currentState!.validate()) {
      var url = Uri.parse("http://192.168.10.13/php/regsiter.php");
      var response = await http.post(url, body: {
        "username": username,
        "password": password
      });

      var data = json.decode(response.body);
      if (data == "Error") {
        Fluttertoast.showToast(msg: "This User already exist");
      } else {
        Fluttertoast.showToast(msg: "Registration Successfull");
      }
    }
  }

  toLogin (BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: "Sign in".text.xl4.black.make(),
        leading: IconButton(
          onPressed: (){
            toLogin(context);
          },
          icon: Icon(CupertinoIcons.back),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20,),
            "Sign up with one of the options".text.xl.gray700.make(),
            SizedBox(height: 30,),
            GFWidget(),
            SizedBox(height: 50,),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Username".text.size(17).black.bold.make().px8(),
                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "gauravmasand",
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
                          return "Username required";
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
                        onTap: () => register(),
                        child: AnimatedContainer (
                          duration: Duration(seconds: 1),
                          width: double.infinity,
                          height: 60,
                          alignment: Alignment.center,
                          child: "Sign in".text.xl.blueGray100.bold.make(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Aleady having an account?".text.gray400.bold.make().px(4),
                        InkWell(
                          onTap: () {toLogin(context);},
                          child: "Login up".text.blueGray600.bold.make().px(4),
                        ),
                      ],
                    ),
                    SizedBox(height: 100,),
                  ],
                )
            ).px(1),
          ],
        ).px(31),
      ),
    );
  }
}
