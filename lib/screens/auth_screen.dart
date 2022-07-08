import 'package:flutter/services.dart';

import '../widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  // AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
  ) async {
    AuthResult authResult;
    try{
    if (isLogin) {
      authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } else {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
    } on PlatformException catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: AuthForm(_submitAuthForm),
          ),
        ),
      ),
    );
  }
}
