import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background(this.child);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: Container(
                color: Color.fromRGBO(75, 66, 55, 1),
              ),
            ),
            child,
          ],
        ));
  }
}
