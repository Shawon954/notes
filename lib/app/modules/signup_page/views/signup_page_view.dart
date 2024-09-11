import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../utils/validator.dart';
import '../../../widget/custom_material_button.dart';
import '../../../widget/custom_textformfiled.dart';
import '../controllers/signup_page_controller.dart';

class SignupPageView extends StatelessWidget {

  final controller = Get.put(SignupPageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(AppString.reg, style: TextStyle(fontSize: 25,
                    color: AppColors.textDark90,
                    fontWeight: FontWeight.bold),),

                SizedBox(height: 100,),
                Obx(() {
                  return Form(
                      key: controller.signup_key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Name
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            controller: controller.nameController,
                            labelText: 'Name',
                            validator: (name)=>ErrorMessage().nameError(name!),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          // Email
                          CustomTextFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            labelText: 'Email',
                            validator: (email)=>ErrorMessage().validateEmail(email!),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // Password
                          CustomTextFormField(
                            textInputType: TextInputType.text,
                            controller: controller.passwordController,
                            validator: (password)=>ErrorMessage().validatePassword(password!),
                            obscure: controller.isObscured.value,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscured.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.togglePasswordVisibility();
                              },
                            ),
                            labelText: 'Password',
                          ),
                        ],
                      ));
                }),

                SizedBox(
                  height: 60,
                ),

                // Custom Button
                CustomMaterialButton(
                  title: 'Sign Up',
                  fontSize: 20,
                  onPressed: () {
                    if (controller.signup_key.currentState!.validate()) {
                      print('ok');
                    }
                  },
                  height: 55,
                  width: 180,

                  color: AppColors.primaryLight,
                ),
                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: TextStyle(color: AppColors.textDark90,fontSize: 15),),
                    InkWell(
                      onTap: (){
                        GoRouter.of(context).go('/login_page');
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.blue,fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
