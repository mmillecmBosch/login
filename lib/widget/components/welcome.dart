import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/widget/components/button.dart';

class WelcomePage extends StatelessWidget {
  final Function click;
  WelcomePage(this.click);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Text(
            'Welcome Devs',
            style: GoogleFonts.quicksand(
                fontSize: 40,
                textStyle: TextStyle(
                  color: Color.fromRGBO(213, 160, 33, 1),
                )),
          ),
        ),
        Button('SIGN UP', click, 'sign'),
        Button('LOGIN', click, 'login'),
      ],
    );
  }
}
