import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model.dart';

class HomePageController extends GetxController {


  final user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;


  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  final dataList = <DataModel>[].obs;


  void fetchData() async {
    try {

      final querySnapshot = await firestore.collection('NoteUser').doc(user!.email).collection('notes').get();

      dataList.value = querySnapshot.docs.map((doc) => DataModel.fromMap(doc.data())..id = doc.id).toList();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

}
