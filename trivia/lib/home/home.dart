import 'package:flutter/material.dart';
import 'package:trivia/shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'about',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => {
            Navigator.pushNamed(context, '/about')
          },
        ),
      ),
    );
  }
}