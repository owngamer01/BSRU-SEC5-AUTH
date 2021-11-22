import 'package:flutter/material.dart';
import 'package:myapp/auth/login_page.dart';
import 'package:myapp/auth/register_page.dart';
import 'package:myapp/home/home_page.dart';
import 'package:myapp/home/item_detail_page.dart';
import 'package:myapp/model/food_model.dart';
import 'package:myapp/home/more_page.dart';
import 'package:myapp/splash_screen_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        RegisterPage.page: (_) => const RegisterPage(),
        HomePage.page: (_) => const HomePage()
      },
      
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MorePage.page:
            final foodItem = settings.arguments as FoodGroup;
            return MaterialPageRoute(
              builder: (context) => MorePage(foodItem) 
            );
          case ItemDetailPage.page:
            final foodItem = settings.arguments as FoodItem;
            return MaterialPageRoute(
              builder: (context) => ItemDetailPage(foodItem) 
            );
          default:
        }
      },

    );
  }
}