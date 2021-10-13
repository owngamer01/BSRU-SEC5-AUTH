import 'package:flutter/material.dart';
import 'package:myapp/auth/controller/auth_controller.dart';
import 'package:myapp/home/item_detail_page.dart';
import 'package:myapp/home/model/food_model.dart';
import 'package:myapp/home/more_page.dart';

class HomePage extends StatefulWidget {

  static const String page = "home";

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthController authController = AuthController();

  void _toMorePage(FoodGroup foodGroup) {
    Navigator.pushNamed(context, MorePage.page, arguments: foodGroup);
  }

  void _toItemDetailPage(FoodItem foodItem) {
    Navigator.pushNamed(context, ItemDetailPage.page, arguments: foodItem);
  }

  @override
  Widget build(BuildContext context) {

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

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text("Food BSRU App"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(15),
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
                    child: Text("More")
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
          ))
        ]
      )
    );
  }
}