import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:notes/app/modules/signup_page/controllers/signup_page_controller.dart';
import 'package:notes/app/routes/go_routes.dart';

class AuthService {

  final signupController = Get.put(SignupPageController());
  final signinController = Get.put(LoginPageController());
  final auth = FirebaseAuth.instance;

  Future<void>UserRegister(context)async{
    try {
      final userCradintial = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupController.emailController.text.trim(),
        password: signupController.passwordController.text.trim(),
      );
      var authUserCrd = userCradintial.user;

      if(authUserCrd!.uid.isNotEmpty){
        GoRouter.of(context).go('/home_page');
        Get.snackbar('Registration', "Your account create successful");
      } else{
        Get.snackbar('Failed', "Your account not create");
      }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar('Week Password', "The password provided is too weak.",colorText: Colors.amber);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('Already exists', "The account already exists for that email.",colorText: Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void>UserLogin(context)async{
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: signinController.emailController.text.trim(),
          password: signinController.passwordController.text.trim()
      );

      var authCredential = credential.user;
       print(authCredential);
      if(authCredential!.uid.isNotEmpty){
        GoRouter.of(context).go('/home_page');
        Get.snackbar('Welcome', 'Login Successful');
;      } else{
        Get.snackbar('Failed', 'Login Failed');
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar('User Not found', "No user found for that email.",colorText: Colors.amber);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar('Wrong password', "Wrong password provided for that user.",colorText: Colors.red);
      }
    }
  }


}
  
