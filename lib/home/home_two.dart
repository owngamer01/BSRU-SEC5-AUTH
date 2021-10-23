import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/cart_controller.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartController = Get.find<CartController>();

    return Obx(() => ListView.builder(
      itemCount: cartController.cart.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(cartController.cart[index].name),
        subtitle: Text(cartController.cart[index].detail),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(cartController.cart[index].image),
        )
      )
    ));
  }
}