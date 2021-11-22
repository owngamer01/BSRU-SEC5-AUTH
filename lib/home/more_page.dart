import 'package:flutter/material.dart';
import 'package:myapp/home/item_detail_page.dart';
import 'package:myapp/model/food_model.dart';

class MorePage extends StatelessWidget {

  static const String page = "more";
  final FoodGroup foodGroup;

  const MorePage(this.foodGroup, { Key? key }) 
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodGroup.name),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: foodGroup.list.map((item) => Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ItemDetailPage.page, arguments: item);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(item.image, fit: BoxFit.cover)
                  ),
                  Expanded(
                    child: Text(item.detail)
                  )
                ]
              ),
            ),
          )).toList(),
        )
      )
    );
  }
}