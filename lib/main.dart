import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/form_booking.dart';
import 'widgets/splash_screen.dart';


void main() {
  
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/form_booking': (context) => const FormBookingPage(), // ← agrega esta
      },
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoteles México',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
