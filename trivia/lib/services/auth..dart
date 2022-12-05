import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException { //there is a catch (e) in the guide here
      // error handled
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
