import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../controllers/addnote_page_controller.dart';

class AddnotePageView extends GetView<AddnotePageController> {
  const AddnotePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.pageBackground,
      body: const Center(
        child: Text(
          'AddnotePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
