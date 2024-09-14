import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';

import '../../../core/model.dart';

class AddnotePageController extends GetxController {
  final note_key = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  RxInt maxLines = 1.obs;


  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance.currentUser;


  var dataList = <DataModel>[].obs;

  Future<void> saveNote(con,) async {
    try {


      final docRef =  await firestore
            .collection('NoteUser')
            .doc(auth!.email)
            .collection('notes')
            .add(
            DataModel(title: titleController.text, details: detailsController.text).toMap());

        GoRouter.of(con).go('/home_page');
        Get.snackbar('Success', 'Note saved successfully!',
            snackPosition: SnackPosition.TOP);
        titleController.clear();
        detailsController.clear();

      dataList.add(docRef as DataModel);

    } catch (e) {
      Get.snackbar('Error', 'Failed to save note',
          snackPosition: SnackPosition.TOP);
    }
  }




  @override
  void dispose() {
    titleController.clear();
    detailsController.clear();
    super.dispose();
  }
}
