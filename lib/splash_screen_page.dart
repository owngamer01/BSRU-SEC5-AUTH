import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/auth/login_page.dart';
import 'package:myapp/controller/cart_controller.dart';
import 'package:myapp/controller/product_controller.dart';
import 'package:myapp/home/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  static const String page = "splashscreen";
  const SplashScreenPage({ Key? key }) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  void init() async {

    await Firebase.initializeApp();

    // # init get
    Get.put(CartController());

    // # TODO:: ใช้ครั้งเดียว
    // ProductControlelr().setProductGroup();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {

      Navigator.popUntil(context, ModalRoute.withName(SplashScreenPage.page));

      // # ถ้ามีการ Login
      if (user != null) {
        Navigator.pushNamed(context, HomePage.page);
      }
      // # ถ้า Logout
      else {
        Navigator.pushNamed(context, LoginPage.page);
      }

    });
    
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