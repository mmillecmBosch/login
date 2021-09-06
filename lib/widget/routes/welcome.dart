import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/widget/components/avatar_circle.dart';
import 'package:login/widget/routes/login.dart';
import 'package:login/widget/routes/sign_is.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "/welcome";

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
                'Welcome Devs',
                style: GoogleFonts.quicksand(
                  fontSize: 40,
                  textStyle: TextStyle(
                    color: Color.fromRGBO(213, 160, 33, 1),
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.all(10),
              child: TextButton(
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {
                  Navigator.of(context).pushReplacementNamed(Login.routeName),
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(213, 160, 33, 1),
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.all(10),
              child: TextButton(
                child: Text(
                  'SIGN IN',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => {
                  Navigator.of(context).pushReplacementNamed(Sign.routeName),
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
    );
  }
}
