import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addnote_page_controller.dart';

class AddnotePageView extends GetView<AddnotePageController> {
  const AddnotePageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddnotePageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddnotePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
