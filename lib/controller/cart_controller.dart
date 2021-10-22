import 'package:get/get.dart';
import 'package:myapp/home/model/food_model.dart';

class CartController extends GetxController {
  RxList<FoodItem> _cart = <FoodItem>[].obs;
  RxList<FoodItem> get cart => _cart;

  addCart(FoodItem foodItem) {
    _cart.add(foodItem);
  }

  setCart(List<FoodItem> foodSet) {
    _cart = foodSet.obs;
  }
}