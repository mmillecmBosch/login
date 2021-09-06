import 'package:flutter/material.dart';
import 'package:login/models/user.dart';

import 'package:login/widget/routes/home_page.dart';
import 'package:login/widget/routes/login.dart';
import 'package:login/widget/routes/sign_is.dart';
import 'package:login/widget/routes/welcome.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  String username = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: WelcomePage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case WelcomePage.routeName:
            return MaterialPageRoute(
              builder: (context) => WelcomePage(),
            );
          case Login.routeName:
            return MaterialPageRoute(
              builder: (context) => Login(),
            );
          case Sign.routeName:
            return MaterialPageRoute(
              builder: (context) => Sign(),
            );
          case HomePage.routeName:
            final args = settings.arguments as User;
            return MaterialPageRoute(
              builder: (context) => HomePage(args.username),
            );
        }
      },
    );
  }
}
