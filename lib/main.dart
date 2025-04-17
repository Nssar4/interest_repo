// main.dart
import 'package:flutter/material.dart';
import 'interests_screen.dart';
import 'home_screen.dart';
import 'save_screen.dart';
import 'community_screen.dart';
import 'reels_screen.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => InterestsScreen(),
        '/home': (ctx) => HomeScreen(),
        '/saved': (ctx) => SaveScreen(savedItems: []),
        '/community': (ctx) => CommunityScreen(),
        '/reels': (ctx) => ReelsScreen(),
        '/dashboard': (ctx) => DashboardScreen(),
        '/profile': (ctx) => ProfileScreen(),
      },
    );
  }
}
