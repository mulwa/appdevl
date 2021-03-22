import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test00001020/Screen/HomePage.dart';
import 'package:test00001020/Screen/mylocation_screen.dart';
import 'package:test00001020/providers/auth_provider.dart';
import 'package:test00001020/providers/location_provider.dart';
import 'package:test00001020/welcomeScreen.dart';
import 'Screen/landing_screen.dart';
import 'Screen/login_screen.dart';
import 'Screen/map_screen.dart';
import 'Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => LocationProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        MapScreen.id: (context) => MapScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        LandingScreen.id: (context) => LandingScreen(),
        HomePage.id: (context) => HomePage(),
        MyLocationScreen.id: (context) => MyLocationScreen()
      },
    );
  }
}
