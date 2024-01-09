import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:front/screen/sign_in_checker.dart';
import 'package:front/util/constants.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/images/cat.png'),
            ),
            const Text(
              'Loading...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Alegreya Sans SC',
                fontWeight: FontWeight.w400,
                color: kAccentColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
      nextScreen: SignInChecker(),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
