import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CircleAvatar(
      backgroundImage: AssetImage('assets/image/kitty.png'),
      backgroundColor: Color.fromRGBO(213, 160, 33, 1),
      radius: size.height * 0.09,
    );
  }
}
