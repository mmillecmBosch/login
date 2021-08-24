import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/widget/components/home_page.dart';
import 'package:login/widget/components/login.dart';
import 'package:login/widget/components/sign_is.dart';
import 'package:login/widget/components/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _page = 'welcome';
  String _username = "";

  void _changeScreen(String screen) {
    setState(() {
      _page = screen;
    });
  }

  void _sign(String newUsername, String newPassword) {
    final newUser = User(
      username: newUsername,
      password: newPassword,
    );

    setState(() {
      _addUsers(newUser);
      _page = 'welcome';
    });
  }

  Future<void> _addUsers(User user) async {
    final _prefs = await SharedPreferences.getInstance();

    await _prefs.setString(
      user.username,
      jsonEncode(user.toJson()),
    );
    var jsonUser = _prefs.getString(user.username);
  }

  Future<void> _login(String checkUsername, String checkPassword) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.getString(checkUsername);

    var bdUser = (_prefs.getString(checkUsername));
    var loginUser =
        "{\"username\":\"$checkUsername\",\"password\":\"$checkPassword\"}";

    if (bdUser == loginUser) {
      setState(() {
        _page = 'home';
        _username = checkUsername;
      });
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

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/image/kitty.png'),
            backgroundColor: Color.fromRGBO(213, 160, 33, 1),
            radius: size.height * 0.09,
          ),
          if (_page == 'welcome') WelcomePage(_changeScreen),
          if (_page == 'login') Login(_changeScreen, _login),
          if (_page == 'sign') Sign(_changeScreen, _sign),
          if (_page == 'home') HomePage(_username, _changeScreen),
        ],
      ),
    );
  }
}
