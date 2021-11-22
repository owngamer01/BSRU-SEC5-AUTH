import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/model/food_model.dart';

class CartController extends GetxController {
  
  final String _collection = "carts";
  final _fireCarts = FirebaseFirestore.instance.collection('users');

  RxList<FoodItem> _cart = <FoodItem>[].obs;
  RxList<FoodItem> get cart => _cart;

  void getCart() async {
    if (!AuthController.isHasUser) return;

    _cart = <FoodItem>[].obs;

    final allFoodInCart = await _fireCarts.doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(_collection)
      .get();
    
    final foodList = allFoodInCart.docs.map((snapshot) => FoodItem.fromJson(
      snapshot.data()
    )).toList();

    _cart.addAll(foodList);
  }

  void addCart(FoodItem foodItem) {

    // DocumentReference<Map<String, dynamic>> getDocfood(FoodItem foodItem) {
    // return _fireCarts.doc(FirebaseAuth.instance.currentUser!.uid)
    //   .collection(_collection)
    //   .doc(foodItem.id); 
    
    if (!AuthController.isHasUser) return;

    // # ถ้ามีในตระกร้าแล้ว
    final cartIndex = _cart.indexOf(foodItem);
    if(cartIndex != -1) {

      // ให้เพิ่มสินค้าเดิม +1 (local)
      _cart[cartIndex].amount += 1;

      // # ให้เพิ่มสินค้าเดิม +1 (firestore)
      getDocfood(foodItem).update(foodItem.updateAmount());

    } else {

      // # add carts local
      _cart.add(foodItem);

      // # add carts firestore
      getDocfood(foodItem).set(foodItem.toJson());
    }
  }

  void removeCartItem(FoodItem foodItem) {
    _cart.remove(foodItem);

    // # add carts firestore
    getDocfood(foodItem).delete();
  }

   DocumentReference<Map<String, dynamic>> getDocfood(FoodItem foodItem) {
    return _fireCarts.doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(_collection)
      .doc(foodItem.id); 
  }
}