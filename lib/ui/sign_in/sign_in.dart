import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/network/api_provider.dart';
import 'package:flutterbloc/repositories/login_repository.dart';

import 'bloc/login_bloc.dart';


class SignIn extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  double locLatitude;
  double locLongitude;
  bool passwordVisible = true;
  bool isEmail = false;

  final loginBloc = LoginBloc(LoginRepository(ApiProvider()));

  @override
  void initState() {
    observeStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text("Welcome back!",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.black87)),
                    subtitle: Text(
                      "Enter your details to continue.",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black38),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: "Email/Mobile Number",
                                prefixIcon: Icon(
                                  Icons.phone_android_sharp,
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 16,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  showForgotPasswordSheet();
                                },
                                child: Text(
                                  "Forgot Password?",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            FlatButton(
                              child: Text("Sign In"),
                              onPressed: () {
                                if(_formKey.currentState.validate()) {
                                  loginBloc.login(_phoneController.text, _passwordController.text);
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          text: "Not a Member? ",
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) => SignUp()));
                                  },
                                text: "Sign Up",
                                style: TextStyle(color: Colors.red))
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }

  void showForgotPasswordSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (_) {
          //return PasswordWrapper();
        });
  }

  void observeStream() {

    loginBloc.loadingStream.listen((event) {
      //todo handle loader
    });

    loginBloc.errorStream.listen((errorMessage) {
      print("ERROR: " + errorMessage);
      //todo handle error
    });

    loginBloc.userStream.listen((user) {
      print("USER DATA " + user.name);
      //todo go to next page
    });
  }
}
