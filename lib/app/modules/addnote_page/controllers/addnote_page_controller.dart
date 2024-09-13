import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddnotePageController extends GetxController {
  final note_key = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  RxInt maxLines = 1.obs;

  final  auth = FirebaseAuth.instance;
  final  firestore = FirebaseFirestore.instance;


  Future<void> saveNote() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        String userId = user.uid;

        await firestore.collection('users').doc(userId).collection('notes').add({
          'title': titleController.text,
          'details': detailsController.text,
          'createdAt': Timestamp.now(),
        });

        Get.snackbar('Success', 'Note saved successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'No user logged in',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save note',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
