import 'package:flutter/material.dart';
import 'package:myapp/auth/controller/auth_controller.dart';
import 'package:myapp/auth/register_page.dart';

class LoginPage extends StatefulWidget {

  static const String page = "login";
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthController authController = AuthController();

  // # สร้าง formkey เพื่อ ผูกค่ากับ Form widget ในการ validate ข้อมูลใน Form
  final GlobalKey formkey = GlobalKey<FormState>();

  final userController = TextEditingController();
  final passController = TextEditingController();

  void onLogin() {
    authController.onLogin(
      userController.text, 
      passController.text
    );
  }

  void toRegister() {
    // # เปลี่ยนหน้าจาก login ไปยัง register
    Navigator.pushNamed(context, RegisterPage.page);
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // # แสดงรูปภาพ Internet
            Center(child: Image.network("https://s3-symbol-logo.tradingview.com/facebook--600.png", width: 200)),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    // # สร้าง ตัวช่วยในการตรวจสอบข้อมูล สำหรับ Form
                    validator: (String? message) {

                      // # กำหนดเงือนไขถ้า input มีค่าน้อยกว่า 5 ตัวอักษร จะให้แสดง error ตามข้อความต่อไปนี้
                      return message == null || message.length < 5 ? "ต้องใส่มากกว่า 5 ตัวอักษร" : null;

                    },
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      label: Text("Username")
                    ),
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      label: Text("Password")
                    ),
                  )
                ],
              )
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onLogin, 
                child: Text("Login")
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: toRegister, 
                child: Text("Register")
              ),
            )
          ]
        )
      )
    );
  }
}