import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';

import '../../../core/auth.dart';

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

  // SingUp Auth

    var singup = AuthService().signup();

}
