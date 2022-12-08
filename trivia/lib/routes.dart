import 'package:trivia/about/about.dart';
import 'package:trivia/profile/profile.dart';
import 'package:trivia/topics/topics.dart';
import 'package:trivia/login/login.dart';
import 'package:trivia/home/home.dart';




var appRoutes = {
  '/': (context) => const Homescreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
