import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartController = Get.find<CartController>();

    return Obx(() => ListView.builder(
      itemCount: cartController.cart.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(cartController.cart[index].name),
        subtitle: Text(cartController.cart[index].detail + " ${cartController.cart[index].amount} bath ${cartController.cart[index].price}"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(cartController.cart[index].image),
        ),
        trailing: IconButton(
          onPressed: () {
            cartController.removeCartItem(cartController.cart[index]);
          }, 
          icon: const Icon(Icons.delete)
        ),
      )
    ));
  }
}