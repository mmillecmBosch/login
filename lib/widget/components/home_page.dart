import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  final String _username;
  HomePage(this._username);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController animationController;
  var animationCheck = false;

  void initState() {
    this.animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        if (!animationCheck)
          SizedBox(
            height: 300,
            width: 300,
            child: LottieBuilder.asset(
              'assets/json/scanning-documents.json',
              repeat: false,
              controller: this.animationController,
              onLoaded: (composition) {
                this.animationController.duration = composition.duration;
                this.animationController.forward();
                this.animationController.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    setState(() {
                      animationCheck = true;
                    });
                  }
                });
              },
            ),
          ),
        if (animationCheck)
          MessageWelcome(
            size: size,
            username: widget._username,
          )
      ],
    );
  }
}

class MessageWelcome extends StatelessWidget {
  const MessageWelcome({
    Key? key,
    required this.size,
    required this.username,
  }) : super(key: key);

  final Size size;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: size.height * 0.5,
          child: LottieBuilder.asset('assets/json/sparkle.json'),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Welcome ' + username,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.05,
            ),
          ),
        )
      ],
    );
  }
}
