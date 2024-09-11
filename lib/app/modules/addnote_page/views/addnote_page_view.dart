import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';
import 'package:notes/app/widget/custom_material_button.dart';
import 'package:notes/app/widget/custom_textformfiled.dart';

import '../../../utils/app_color.dart';
import '../controllers/addnote_page_controller.dart';

class AddnotePageView extends StatelessWidget {
  final controller = Get.put(AddnotePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).go('/home_page');
                    },
                    child: Icon(Icons.arrow_back_outlined,color: AppColors.textDark70,size: 20,),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text(
                      'Write Note',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textDark90,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
                  CustomMaterialButton(
                    title: 'Save',
                    width: 100,
                    onPressed: () {},
                    color: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                  key: controller.note_key,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: CustomTextFormField(
                          controller: controller.titleController,
                          textInputType: TextInputType.text,
                          labelText: 'Title',
                          maxLine: 2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: controller.detailsController,
                        textInputType: TextInputType.text,
                        labelText: 'Details',
                        maxLine: 12,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
