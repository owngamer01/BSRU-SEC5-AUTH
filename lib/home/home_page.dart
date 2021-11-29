import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/controller/cart_controller.dart';
import 'package:myapp/controller/product_controller.dart';
import 'package:myapp/home/product_page.dart';
import 'package:myapp/home/cart_page.dart';

class HomePage extends StatefulWidget {

  static const String page = "home";

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = ProductControlelr();
  final cartController = Get.find<CartController>();
  final AuthController authController = AuthController();
  int currrentIndex = 0;

  int currentIndex = 0;
  late final pages = [
    const ProductPage(),
    CartPage()
  ];

  @override
  void initState() {
    cartController.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: const Text("Food BSRU App")
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled)
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Badge(
              badgeContent: Obx(() => Text(cartController.cart.length.toString())) ,
              child: const Icon(Icons.shopping_cart),
            )
          )
        ]
      ),
      body: pages[currentIndex]
    );
  }
}