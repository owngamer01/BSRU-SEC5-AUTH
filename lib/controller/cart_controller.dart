import 'package:get/get.dart';
import 'package:myapp/home/model/food_model.dart';

class CartController extends GetxController {

  RxList<FoodItem> _cart = <FoodItem>[].obs;
  RxList<FoodItem> get cart => _cart;

  void addCart(FoodItem foodItem) {
    _cart.add(foodItem);

    // # add to firestore
    

  }
}