import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/models/user.dart';

import 'package:login/themes/login_default_theme.dart';
import 'package:login/widget/components/avatar_circle.dart';

import 'package:login/widget/routes/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign extends StatefulWidget {
  static const String routeName = "/signin";

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordView = true;

  String username = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                'SIGN UP',
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
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      focusNode: FocusNode(),
                      textInputAction: TextInputAction.next,
                      onSaved: (String? val) {
                        username = val.toString();
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
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      focusNode: FocusNode(),
                      textInputAction: TextInputAction.done,
                      onSaved: (String? val) {
                        password = val.toString();
                      },
                      obscureText: _passwordView,
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
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.all(20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(213, 160, 33, 1),
                        ),
                      ),
                      child: Text(
                        'SIGN UP',
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _sign(username, password);
                          final actionNewUser = SnackBar(
                            content: Text('User Create'),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(actionNewUser);
                          Navigator.of(context)
                              .pushReplacementNamed(WelcomePage.routeName);
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.all(10),
                    child: TextButton(
                      child: Text(
                        'BACK',
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.of(context)
                            .pushReplacementNamed(WelcomePage.routeName),
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(213, 160, 33, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sign(String newUsername, String newPassword) {
    final newUser = User(
      username: newUsername,
      password: newPassword,
    );

    setState(() {
      _addUsers(newUser);
    });
  }

  Future<void> _addUsers(User user) async {
    final _prefs = await SharedPreferences.getInstance();

    await _prefs.setString(
      user.username,
      jsonEncode(user.toJson()),
    );
  }
}
