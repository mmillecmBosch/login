import 'package:flutter/material.dart';

import 'button.dart';

class HomePage extends StatelessWidget {
  final String username;
  final Function click;
  HomePage(this.username, this.click);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Welcome $username!',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Button('EXIT', click, 'welcome')
        ],
      ),
    );
  }
}
