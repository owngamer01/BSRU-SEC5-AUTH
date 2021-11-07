import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/auth/controller/auth_controller.dart';
import 'package:myapp/auth/model/user_model.dart';

class RegisterPage extends StatefulWidget {

  static const String page = "register";
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  final AuthController authController = AuthController();
  final ImagePicker _picker = ImagePicker();

  // # สร้าง controller เพื่อเก็บค่าของ input
  final userController = TextEditingController();
  final passController = TextEditingController();
  final fullnameController = TextEditingController();
  final ageController = TextEditingController();

  // # สร้าง XFile เพื่อรับค่า รูปภาพ จาก ปลักอิน image_picker
  XFile? file;

  // # สร้างฟังก์ชั่น เพื่อเรียกใช้กล้องถ่ายรูป
  void takePicture() async {
    file = await _picker.pickImage(source: ImageSource.camera);
    if (file == null) return;

    setState(() {});
  }

  void _onRegister() {

    if (file == null) return;

    UserModel userModel = UserModel(
      age: num.parse(ageController.text),
      fullname: fullnameController.text,
      username: userController.text,
      password: passController.text,
      avatarPath: file!.path
    );

    authController.onRegister(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Center(
                child: InkWell(
                  onTap: takePicture,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: file != null ? DecorationImage(
                        image: FileImage(File(file!.path)),
                        fit: BoxFit.cover
                      ) : null
                    ),
                    alignment: Alignment.center,
                    child: Text(file == null ? "UPLOAD AVATAR" : ""),
                  ),
                )
              ),

              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  label: Text("Username")
                ),
              ),
              TextField(
                obscureText: true,
                controller: passController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  label: Text("Password")
                )
              ),
              TextField(
                controller: fullnameController,
                decoration: const InputDecoration(
                  hintText: "Fullname",
                  label: Text("Fullname")
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: "Age",
                  label: Text("Age")
                ),
              ),

              ElevatedButton(
                onPressed: _onRegister, 
                child: const Text("Register")
              )

            ]
          ),
        ),
      )
    );
  }
}