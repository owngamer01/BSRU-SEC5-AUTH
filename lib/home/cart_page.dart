import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/auth_controller.dart';
import 'package:myapp/controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({ Key? key }) : super(key: key);

  late final cartController = Get.find<CartController>();

  void _confirmOrder(BuildContext context) async {

    final user = await AuthController().getUser();
    final result = await cartController.confirmOrder();

    if (result) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('ยินดีด้วยคุณ ${user.fullname} ได้สั่งซื้อสินค้าสำเร็จ'),
            actions: [
              TextButton(
                onPressed: () {
                  // # ปิด Alert
                  Navigator.pop(context);
                }, 
                child: Text('ปิด')
              )
            ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartController.cart.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(cartController.cart[index].name),
              subtitle: Text("${cartController.cart[index].price} bath (${cartController.cart[index].amount}x)"),
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
          ),
        ),
        InkWell(
          onTap: () {
            _confirmOrder(context);
          },
          child: Container(
            color: Colors.pink,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            child: Text('สั่งซื้่อสินค้า', style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )),
          ),
        )
      ],
    ));
  }
}