import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/themes/login_default_theme.dart';
import 'button.dart';
import 'input_style.dart';

class Login extends StatefulWidget {
  final Function click;
  final Function login;

  Login(
    this.click,
    this.login,
  );

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
    return Column(
      children: [
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
                  focusNode: FocusNode(),
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
                  decoration: LoginDefaultTheme.loginInputDecoration.copyWith(
                      labelText: 'Username',
                      prefixIcon: Icon(
                        Icons.account_box,
                        color: Color.fromRGBO(213, 160, 33, 1),
                      )),
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
                  decoration: LoginDefaultTheme.loginInputDecoration.copyWith(
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
                        _passwordView ? Icons.visibility : Icons.visibility_off,
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
          margin: EdgeInsets.all(20),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(213, 160, 33, 1),
              ),
            ),
            child: Text(
              'LOGIN  ',
              style: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.login(_username, _password);
              }
            },
          ),
        ),
        Button('SIGN UP', widget.click, 'sign')
      ],
    );
  }
}
