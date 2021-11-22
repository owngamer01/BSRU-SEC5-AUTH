import 'package:flutter/material.dart';
import 'package:myapp/controller/product_controller.dart';
import 'package:myapp/home/item_detail_page.dart';
import 'package:myapp/model/food_model.dart';
import 'package:myapp/home/more_page.dart';

class ProductPage extends StatefulWidget {

  const ProductPage({ 
    Key? key
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List<FoodGroup> foodGroup = [];

  void _toMorePage(FoodGroup foodGroup) {
    Navigator.pushNamed(context, MorePage.page, arguments: foodGroup);
  }

  void _toItemDetailPage(FoodItem foodItem) {
    Navigator.pushNamed(context, ItemDetailPage.page, arguments: foodItem);
  }

  void _getProductGroup() async {
    foodGroup = await ProductControlelr().getProductGroup();
    setState(() {});
  } 

  @override
  void initState() {
    super.initState();
    _getProductGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.all(15),
          child: Text("List of menus ${foodGroup.length}", style: TextStyle(
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
        ))
      ]
    );
  }
}