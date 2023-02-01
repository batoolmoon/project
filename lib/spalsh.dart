import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}
void initState() {
  super.initState();

  _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );}
class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SlideTransition(
            position: _offsetAnimation,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/logo.png',
                  width: 150.0,
                )
            ),
          ),
        )
    );
  }
}
