import 'package:flutter/material.dart';
import 'package:myapp/auth/login_page.dart';
import 'package:myapp/auth/register_page.dart';
import 'package:myapp/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // # หน้าแรกที่จะให้ app แสดง
      initialRoute: SplashScreenPage.page,

      // # สร้าง route เพื่อบอก app เราว่ามีหน้าไหนบ้าง
      routes: {
        SplashScreenPage.page: (_) => const SplashScreenPage(),
        LoginPage.page: (_) => const LoginPage(),
        RegisterPage.page: (_) => const RegisterPage()
      }
    );
  }
}