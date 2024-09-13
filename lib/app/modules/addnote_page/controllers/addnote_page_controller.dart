import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/router.dart';
import 'package:notes/app/routes/go_routes.dart';

class AddnotePageController extends GetxController {
  final note_key = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  RxInt maxLines = 1.obs;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  var isnoteadd = false.obs;

  Future<dynamic> saveNote(con) async {
    try {
      isnoteadd.value = true;
      User? user = auth.currentUser;
      if (user != null) {
        String? userId = user.email;
        print(userId);
        await firestore
            .collection('NoteUser')
            .doc(userId)
            .collection('notes')
            .add({
          'title': titleController.text,
          'details': detailsController.text,
          'createdAt': Timestamp.now(),
        });

        GoRouter.of(con).go('/home_page');
        Get.snackbar('Success', 'Note saved successfully!',
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar('Error', 'No user logged in',
            snackPosition: SnackPosition.TOP);
      }
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
