import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {

  final form_key = GlobalKey<FormState>();

  // controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // password show
  var isObscured = true.obs;

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

}
