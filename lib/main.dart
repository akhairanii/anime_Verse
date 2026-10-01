import 'package:flutter/material.dart';
import 'package:anime_verse/screens/signin_screen.dart';
import 'package:anime_verse/screens/signup_screen.dart';
import 'package:anime_verse/screens/home_screen.dart';
import 'package:anime_verse/screens/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Verse',
      home: const FavoriteScreen(),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
      ),
      // Halaman pertama yang dibuka saat aplikasi dijalankan
      initialRoute: '/signin',
      // Daftar seluruh rute/halaman aplikasi
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}