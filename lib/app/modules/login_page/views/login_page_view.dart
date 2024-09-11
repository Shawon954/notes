import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notes/app/utils/app_string.dart';
import 'package:notes/app/utils/validator.dart';

import '../../../utils/app_color.dart';
import '../../../widget/custom_material_button.dart';
import '../../../widget/custom_textformfiled.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends StatelessWidget {
  final controller = Get.put(LoginPageController());

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

                Text(AppString.login, style: TextStyle(fontSize: 25,
                    color: AppColors.textDark90,
                    fontWeight: FontWeight.bold),),

                SizedBox(height: 100,),
                Obx(() {
                  return Form(
                      key: controller.form_key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

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
                  title: 'Log In',
                  fontSize: 20,
                  onPressed: () {
                    if (controller.form_key.currentState!.validate()) {
                     print('ok');
                    }
                  },
                  height: 55,
                  width: 180,

                  color: AppColors.primaryLight,
                )
              ],
            ),
          ),
        ));
  }
}
