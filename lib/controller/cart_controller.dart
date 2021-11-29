import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/model/food_model.dart';
import 'package:myapp/service/order_service.dart';

class CartController extends GetxController {
  
  final String _collection = "carts";
  final _fireCarts = FirebaseFirestore.instance.collection('users');

  RxList<FoodItem> _cart = <FoodItem>[].obs;
  RxList<FoodItem> get cart => _cart;

  void getCart() async {
    if (!AuthController.isHasUser) return;

    _cart = <FoodItem>[].obs;

    // # ดึงสินค้าจากตระกร้าใน (firestore)
    final allFoodInCart = await _fireCarts.doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(_collection)
      .get();
    
    // # แปลงข้อมูล JSON เป็น Data class FoodItem
    final foodList = allFoodInCart.docs.map((snapshot) => FoodItem.fromJson(
      snapshot.data()
    )).toList();

     // # เพิ่ม FoodItemทั้งหมด ลงตระกร้า (local)
    _cart.addAll(foodList);
  }

  void addCart(FoodItem foodItem) {

    if (!AuthController.isHasUser) return;

    // # ถ้ามีในตระกร้าแล้ว
    final cartIndex = _cart.indexWhere((item) => item.id == foodItem.id);

    if(cartIndex != -1) {

      // ให้เพิ่มสินค้าเดิม +1 (local)
      _cart[cartIndex].amount += 1;

      // # ให้เพิ่มสินค้าเดิม +1 (firestore)
      getDocfood(foodItem).update(foodItem.updateAmount());

    } else {

      // # เพิ่มสินค้าใหม่ +1 (local)
      _cart.add(foodItem);

      // # เพิ่มสินค้าใหม่ +1 (firestore)
      getDocfood(foodItem).set(foodItem.toJson());
    }
  }

  void removeCartItem(FoodItem foodItem) {
    // # ลบสินค้าออก -1 (local)
    _cart.remove(foodItem);

    // # ลบสินค้าออก -1 (firestore)
    getDocfood(foodItem).delete();
  }

   DocumentReference<Map<String, dynamic>> getDocfood(FoodItem foodItem) {
    return _fireCarts.doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(_collection)
      .doc(foodItem.id); 
  }

  Future<bool> confirmOrder() async {
    final orderService = OrderService();
    final result = await orderService.orderConfirm(_cart.toList());

    if (!result) return false;

    for (var item in _cart.toList()) {
      removeCartItem(item);
    }

    return result;
  }
}