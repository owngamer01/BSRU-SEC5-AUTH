import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/cart_controller.dart';
import 'package:myapp/home/model/food_model.dart';
import 'package:badges/badges.dart';

class ItemDetailPage extends StatefulWidget {

  final FoodItem foodItem;

  static const String page = "item_detail";

  const ItemDetailPage(this.foodItem, { Key? key }) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {

  final cartController = Get.find<CartController>();

  void _addtoCart() {
    cartController.addCart(widget.foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodItem.name),
        actions: [
          IconButton(
            onPressed: _addtoCart, 
            icon: Badge(
              badgeContent: Obx(() => Text(cartController.cart.length.toString())),
              child: const Icon(Icons.shopping_cart),
            )
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // # รูป
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(widget.foodItem.image, fit: BoxFit.cover)
            ),

            // # ข้อความรายละเอียด
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("รายละเอียด", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                  Text(widget.foodItem.detail)
                ]
              )
            ),
            
            Expanded(child: Container()),

            // # ปุ่มเพิ่มสินค้า
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: _addtoCart, 
                child: const Text("Add to cart")
              ),
            ),
          ]
        ),
      ),
    );
  }
}