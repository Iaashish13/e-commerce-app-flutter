import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizmo/Screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
     
          Navigator.pushReplacement(context,PageTransition(type: PageTransitionType.leftToRight,child:const  HomeScreen()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 400,
            child: Lottie.asset('assets/animations/pizza-slice.json'),
          ),
          RichText(
            text: const TextSpan(
              text: 'Pi',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2,
               
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'z',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: Colors.red,
                    letterSpacing: 2,
                  ),
                ),
                TextSpan(
                  text: 'Moo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: Colors.black,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
