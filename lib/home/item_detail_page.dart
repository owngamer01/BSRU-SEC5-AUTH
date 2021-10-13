import 'package:flutter/material.dart';
import 'package:myapp/home/model/food_model.dart';

class ItemDetailPage extends StatefulWidget {

  final FoodItem foodItem;

  static const String page = "item_detail";

  const ItemDetailPage(this.foodItem, { Key? key }) : super(key: key);

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodItem.name),
      ),
      body: Container(
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("รายละเอียด", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                  Text(widget.foodItem.detail)
                ]
              )
            ),

            // # ปุ่มเพิ่มสินค้า
            Expanded(child: Container()),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text("Add to cart")
              ),
            )
          ]
        )
      ),
    );
  }
}