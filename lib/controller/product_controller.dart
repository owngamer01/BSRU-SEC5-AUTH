import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/food_model.dart';

class ProductControlelr {

  final _fireProducts = FirebaseFirestore.instance.collection('products');
  final _fireGroups = FirebaseFirestore.instance.collection('groups');

  List<FoodGroup> initGroup() {
    return [
      FoodGroup(
        name: "Group 1",
        list: [
          FoodItem(
            id: "pd-01",
            name: "ปลากระป๋อง", 
            image: "https://media-cdn.tripadvisor.com/media/photo-s/15/03/79/e3/otto-s-anatolian-food.jpg", 
            detail: "detail", 
            price: 10,
            amount: 1
          ),
          FoodItem(
            id: "pd-02",
            name: "ปลากระป๋อง", 
            image: "https://cdn.pixabay.com/photo/2020/06/11/02/12/food-5284892_640.jpg", 
            detail: "detail", 
            price: 10,
            amount: 1
          ),
        ]
      ),
      FoodGroup(
        name: "Group 2",
        list: [
          FoodItem(
            id: "pd-03",
            name: "ปลากระป๋อง", 
            image: "https://cdn.pixabay.com/photo/2020/06/11/02/12/food-5284892_640.jpg", 
            detail: "detail", 
            price: 10,
            amount: 1
          ),
          FoodItem(
            id: "pd-04",
            name: "Hamberger", 
            image: "https://static01.nyt.com/images/2021/02/17/dining/17tootired-grilled-cheese/17tootired-grilled-cheese-articleLarge.jpg?quality=75&auto=webp&disable=upscale", 
            detail: "detail", 
            price: 10,
            amount: 1
          )
        ]
      )
    ];
  }

  void setProductGroup() {
    var group = initGroup();
    for (var item in group) {
      _fireGroups.doc(item.name).set(item.toJsonRefItem());
      for (var product in item.list) {
        _fireProducts.doc(product.id).set(product.toJson());
      }
    }
  }

  Future<List<FoodGroup>> getProductGroup() async {
    List<FoodGroup> foodGroup = [];
    final group = await _fireGroups.get();

    for (var item in group.docs) {

      List<FoodItem> foodList = [];
      var groupJson = item.data();

      for (var productId in groupJson['list']) {
        final getProduct = await _fireProducts.doc(productId).get();

        if (getProduct.data() == null) continue;
        foodList.add(FoodItem.fromJson(getProduct.data()!));
      }

      foodGroup.add(FoodGroup(
        name: groupJson['name'], 
        list: foodList
      ));
    }

    return foodGroup;

  }
}