import '../widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  // AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: AuthForm(),
          ),
        ),
      ),
    );
  }
}
