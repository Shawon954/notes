import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddnotePageController extends GetxController {
  final note_key = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  RxInt maxLines = 1.obs;
}
