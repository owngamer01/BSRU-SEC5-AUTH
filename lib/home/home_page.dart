import 'package:flutter/material.dart';
import 'package:myapp/auth/controller/auth_controller.dart';

class HomePage extends StatefulWidget {

  static const String page = "home";

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            authController.signOut();
          },
          child: Text("Home: SignOut")
        )
      )
    );
  }
}