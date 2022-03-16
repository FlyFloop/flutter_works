import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller_consts.dart';
import 'package:flutter_application_1/controller/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();

  ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width,
      decoration: BoxDecoration(color: Colors.blueAccent[100], boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              onChanged: (value) {
                //Do something wi
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff4338CA),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your email',
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () =>
                    resetPasswordController.resetPassword(textController.text),
                child: Container(
                  width: size.width * 0.8,
                  height: size.height / 20,
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  child: Center(
                    child: Text('Reset password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
