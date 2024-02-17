import 'package:padhle/constants.dart';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  //route name for our screen..
  static String routename = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use AnimatedBuilder to rebuild the widget tree when the animation changes
    //we use future to go from one screen to another
    Future.delayed(Duration(seconds: 5), () {
      //no return possible from login screen to splash screen
      Navigator.pushNamedAndRemoveUntil(
          context,  LoginScreen.routename, (route) => false);
    });

    return Scaffold(
      body: AnimatedBuilder(
        animation: _opacityAnimation,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Use AnimatedOpacity to gradually change the opacity of the text
                AnimatedOpacity(
                  opacity: _opacityAnimation.value,
                  duration: Duration(milliseconds: 500), // Adjust the duration as needed
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Padhle',
                          textStyle: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              backgroundColor: kPrimaryColor)),
                      RotateAnimatedText('Confuse ho...!!',
                          textStyle: TextStyle(
                              letterSpacing: 3,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                      RotateAnimatedText(
                        'Yaha se Padhai karo.',
                        textStyle: TextStyle(
                          fontSize: 30,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 10,
                    pause: Duration(milliseconds: 1000),
                  ),
                  //Text(
                    // 'Padhle',
                    // style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //   color: kTextWhiteColor,
                    //   fontSize: 50,
                    //   fontStyle: FontStyle.italic,
                    //   letterSpacing: 2.0,
                    // ),
                  ),


                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}