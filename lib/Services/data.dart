import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizmo/Screens/details_screen.dart';

import 'dart:async';

class ManagingData with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data,String name) async {
   
    return await firebaseFirestore
        .collection('myOrders')
        .doc(userUid)
        .collection('orders')
        .doc(name)
      
        .set(data);
        
  }

  Future deleteData(BuildContext context,String name) async {
  
  await firebaseFirestore
        .collection('myOrders')
        .doc(userUid)
        .collection('orders')
        .doc(name)
        .delete();
    //     .snapshots()
    //     .forEach((element) {
    //   for (QueryDocumentSnapshot snapshot in element.docs) {
    //     snapshot.reference.delete();
    //   }
    // });
  }

  // Future forOrder(BuildContext context) async {
  //   await firebaseFirestore
  //       .collection('myOrders')
  //       .doc('$userUid')
  //       .delete();
  //       notifyListeners();
  // }
}
