import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/auth/controller/auth_controller.dart';
import 'package:myapp/controller/cart_controller.dart';
import 'package:myapp/item/item_detail_page.dart';
import 'package:myapp/home/model/food_model.dart';
import 'package:myapp/item/more_page.dart';
import 'package:badges/badges.dart';

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

  late final pages = [
    homePage(foodGroup), 
    cartPage()
  ];

  void _toMorePage(FoodGroup foodGroup) {
    Navigator.pushNamed(context, MorePage.page, arguments: foodGroup);
  }

  void _toItemDetailPage(FoodItem foodItem) {
    Navigator.pushNamed(context, ItemDetailPage.page, arguments: foodItem);
  }

  void _onBottomBarTap(int index) {
    setState(() {
      currrentIndex = index;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: const Text("Food BSRU App")
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currrentIndex,
        onTap: _onBottomBarTap,
        items: [
          const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Badge(
              badgeContent: Obx(() => Text(cartController.cart.length.toString())),
              child: const Icon(Icons.shopping_cart)
            )
          )
        ]
      ),
      body: pages[currrentIndex]
    );
  }

  Widget cartPage() => Obx(() => 
    ListView.builder(
      itemCount: cartController.cart.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(cartController.cart[index].name),
          subtitle: Text(cartController.cart[index].detail),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(cartController.cart[index].image),
          ),
        );
      },
    )
  );


  Widget homePage(List<FoodGroup> foodGroup) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const Padding(
        padding: EdgeInsets.all(15),
        child: Text("List of menus", style: TextStyle(
          fontSize: 24
        )),
      ),

      ...foodGroup.map((group) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(group.name),
              ),
              TextButton(
                onPressed: () {
                  _toMorePage(group);
                },
                child: const Text("More")
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: group.list.length,
              itemBuilder: (context, index) {
                final item = group.list[index];
                return InkWell(
                  onTap: () {
                    _toItemDetailPage(item);
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 5),
                    child: Image.network(item.image, fit: BoxFit.cover)
                  ),
                );
              },
            ),
          )
        ]
      )).toList()
    ]
  );
}