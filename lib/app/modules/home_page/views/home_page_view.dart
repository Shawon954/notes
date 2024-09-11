import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';

import '../../../utils/app_color.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
        floatingActionButton: FloatingActionButton(
         child: Icon(Icons.edit,size: 20,color: AppColors.textButtonPrimary,),
          onPressed: (){
           GoRouter.of(context).go('/addnote_page');
          },
          backgroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
        ),
      body: Column(
        children: [
          
        ],
      )
    );
  }
}
