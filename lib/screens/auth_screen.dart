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
    BuildContext ctx,
  ) async {
    AuthResult authResult;
    // if (isLogin) {
    //   authResult = await _auth.signInWithEmailAndPassword(
    //       email: email, password: password);
    // } else {
    //   authResult = await _auth.createUserWithEmailAndPassword(
    //       email: email, password: password);

    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      var message = 'An error occurred, please check your credentials';
      if (error.code == 'ERROR_WRONG_PASSWORD') {
        message = 'Wrong password, please check your credentials';
      } else if (error.code == 'ERROR_USER_NOT_FOUND') {
        message = 'User not found, please check your credentials';
      } else if (error.code == 'ERROR_USER_DISABLED') {
        message = 'User is disabled, please contact support';
      } else if (error.code == 'ERROR_TOO_MANY_REQUESTS') {
        message = 'Too many requests, please try again later';
      } else if (error.code == 'ERROR_OPERATION_NOT_ALLOWED') {
        message = 'Signing in with Email and Password is not enabled';
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).errorColor,
      ));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext ctx) {
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
