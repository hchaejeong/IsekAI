import 'package:flutter/material.dart';
import 'package:front/data/provider/user_provider.dart';
import 'package:front/data/provider/user_provider_old.dart';
import 'package:front/screen/Loading_screen.dart';
import 'package:front/screen/navigation_screen.dart';
import 'package:front/screen/sign_in_checker.dart';
import 'package:front/screen/start_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<UserProvider_old>(
      create: (context) => UserProvider_old(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider_old>(
            create: (context) => UserProvider_old())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => LoadingScreen(),
          SignInChecker.id: (context) => SignInChecker(),
          StartScreen.id: (context) => StartScreen(),
          NavigationScreen.id: (context) => NavigationScreen(),
        },
      ),
    );
  }
}
