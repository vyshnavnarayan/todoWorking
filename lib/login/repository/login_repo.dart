import 'package:firebase_auth/firebase_auth.dart';
import 'package:very_good_app/login/bloc/login_bloc.dart';

import 'package:flutter/material.dart';

class AuthServies {
  var firebaseAuth = FirebaseAuth.instance;

  //* Login User
  Future<void> userlogin(UserLoginEvent event) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);

      throw Exception('invalid email or password');
    }
  }
}
