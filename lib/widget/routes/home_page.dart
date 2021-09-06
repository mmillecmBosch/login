import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/homepage";
  String username;
  HomePage(this.username);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController animationController;
  var animationCheck = false;

  @override
  void initState() {
    super.initState();
    this.animationController = AnimationController(vsync: this);
  }

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
                username: widget.username,
              )
          ],
        ),
      ),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
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
                fontSize: size.height * 0.04,
              ),
            ),
          )
        ],
      ),
    );
  }
}
