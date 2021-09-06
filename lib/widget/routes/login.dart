import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/models/user.dart';

import 'package:login/themes/login_default_theme.dart';
import 'package:login/widget/components/avatar_circle.dart';
import 'package:login/widget/routes/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";

  String _password = "";

  bool _passwordView = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> _login(String checkUsername, String checkPassword) async {
      final _prefs = await SharedPreferences.getInstance();

      var bdUserString = _prefs.getString(checkUsername);
      User userJson = User.fromJson(jsonDecode(bdUserString!));

      var loginUser = User(username: checkUsername, password: checkPassword);

      if (userJson.password == loginUser.password) {
        Navigator.pushNamed(context, HomePage.routeName,
            arguments: User(username: checkUsername, password: checkPassword));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromRGBO(75, 66, 55, 1),
                title: Text(
                  "Incorrect Username or Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(213, 160, 33, 1), fontSize: 20),
                ),
                content: Text(
                  "Please check Username or Passoword",
                  style: TextStyle(
                    color: Color.fromRGBO(213, 160, 33, 1),
                  ),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(213, 160, 33, 1),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              );
            });
      }
    }

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        color: Color.fromRGBO(75, 66, 55, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarCircle(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Text(
                'Login',
                style: GoogleFonts.quicksand(
                    fontSize: 40,
                    textStyle: TextStyle(
                      color: Color.fromRGBO(213, 160, 33, 1),
                    )),
              ),
            ),
            Form(
              key: this._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      onSaved: (String? val) {
                        _username = val.toString();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Blank Space, please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration:
                          LoginDefaultTheme.loginInputDecoration.copyWith(
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.account_box,
                          color: Color.fromRGBO(213, 160, 33, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      obscureText: _passwordView,
                      focusNode: FocusNode(),
                      onSaved: (String? val) {
                        _password = val.toString();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Blank Space, please enter some text';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration:
                          LoginDefaultTheme.loginInputDecoration.copyWith(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color.fromRGBO(213, 160, 33, 1),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordView = !_passwordView;
                            });
                          },
                          icon: Icon(
                            _passwordView
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color.fromRGBO(213, 160, 33, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.all(10),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(213, 160, 33, 1),
                  ),
                ),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _login(_username, _password);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
