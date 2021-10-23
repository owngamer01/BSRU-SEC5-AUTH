import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/auth/controller/auth_controller.dart';
import 'package:myapp/controller/cart_controller.dart';
import 'package:myapp/home/home_one.dart';
import 'package:myapp/home/home_two.dart';
import 'package:myapp/home/model/food_model.dart';

class HomePage extends StatefulWidget {

  static const String page = "home";

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final cartController = Get.find<CartController>();
  final AuthController authController = AuthController();
  int currrentIndex = 0;

  int currentIndex = 0;
  late final pages = [
    HomeOne(foodGroup),
    HomeTwo()
  ];

  final List<FoodGroup> foodGroup = [
    FoodGroup(
      name: "Group 1",
      list: [
        FoodItem(
          name: "ปลากระป๋อง", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 2", 
          image: "https://brandinside.asia/wp-content/uploads/2019/07/shutterstock_1437332618-e1563988304801.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 3", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        )
      ]
    ),
    FoodGroup(
      name: "Group 2",
      list: [
        FoodItem(
          name: "ปลากระป๋อง", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 2", 
          image: "https://brandinside.asia/wp-content/uploads/2019/07/shutterstock_1437332618-e1563988304801.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 3", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 2", 
          image: "https://brandinside.asia/wp-content/uploads/2019/07/shutterstock_1437332618-e1563988304801.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 3", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 2", 
          image: "https://brandinside.asia/wp-content/uploads/2019/07/shutterstock_1437332618-e1563988304801.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 3", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 2", 
          image: "https://brandinside.asia/wp-content/uploads/2019/07/shutterstock_1437332618-e1563988304801.jpg", 
          detail: "detail", 
          price: 10
        ),
        FoodItem(
          name: "ปลากระป๋อง 3", 
          image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
          detail: "detail", 
          price: 10
        )
      ]
    )
  ];

  void _onBottomBarTap(int index) {
    setState(() {
      currrentIndex = index;
    });
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