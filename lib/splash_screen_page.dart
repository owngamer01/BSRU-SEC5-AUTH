import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/auth/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  static const String page = "splashscreen";
  const SplashScreenPage({ Key? key }) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  void init() async {

    await Firebase.initializeApp();

    // # หน่วง 1 วินาที (ต้องใช้ async/await ด้วยนะ)
    await Future.delayed(const Duration(seconds: 1));

    // # เปลี่ยนหน้าไปยัง login
    Navigator.pushNamed(context, LoginPage.page);
    
  }

  // # เมื่อหน้านี้ทำงาน จะให้ทำสิ่งใดก่อนเป็นอันดับแรก
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container()
      )
    );
  }
}