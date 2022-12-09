import 'package:flutter/material.dart';
import 'package:trivia/shared/bottom_nav.dart';
import 'package:trivia/login/login.dart';
import 'package:trivia/shared/bottom_nav.dart';
import 'package:trivia/topics/topics.dart';
import 'package:trivia/services/auth.dart';
import 'package:trivia/Loading/loading.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Text('error');
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}