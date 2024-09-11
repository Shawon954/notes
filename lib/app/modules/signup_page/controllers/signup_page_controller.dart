import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPageController extends GetxController {
  final signup_key = GlobalKey<FormState>();

  // controller

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // password show
  var isObscured = true.obs;

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }
}
