import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Text(
      "Bienvenue",
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );

    return MaterialApp(
      // Application name
      title: 'MidL',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // A widget which will be started on application startup
      routes: {
        '/': (context) => const MyHomePage(title: 'MitL'),
        //'/inscription': (context) => Page3(),
        //'/connexion': (context) => Login(),
        //'/confirmation':((context) => Page5()),
        //'/passeport': (context) => Page6(),
      },
      initialRoute: '/',
    );
  }
}

/// Représente la première page qui s'affiche au lancement de l'application
class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).push(createRoute());
    });
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(const Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png', height: 150),
            const Text(
              "Bienvenue",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            //Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}

/// Permet la smooth transition vers la page de connexion
Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
