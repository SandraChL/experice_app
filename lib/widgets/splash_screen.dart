import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart'; // Si quieres ocultar la barra de estado

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Ocultar barra de estado si quieres fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Timer(Duration(seconds: 10), () {
      Navigator.of(
        context,
      ).pushReplacementNamed('/home'); // asegúrate de tener esa ruta
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // O el color que combine
      body: Center(
        child: Image.asset('assets/images/YAIOSLIDER.gif'), // tu GIF aquí
      ),
    );
  }
}
