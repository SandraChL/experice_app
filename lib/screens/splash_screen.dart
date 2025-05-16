// import 'package:flutter/material.dart';
// import 'dart:async';


// class SplashScreen extends StatefulWidget {
//  const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(const Duration(seconds: 10), () {
//       Navigator.pushReplacementNamed(context, '/login');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset(
//           'assets/images/YAIOSLIDER.gif',
//           width: 250,
//           height: 250,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // 👈 Usa la clase privada
}

class _SplashScreenState extends State<SplashScreen> { // 👈 Esta clase ahora es privada
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/YAIOSLIDER.gif',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
