import 'package:get/get.dart';

import '../controllers/addnote_page_controller.dart';

class AddnotePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnotePageController>(
      () => AddnotePageController(),
    );
  }
}
