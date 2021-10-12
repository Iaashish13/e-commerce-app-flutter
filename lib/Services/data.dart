
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManagingData extends ChangeNotifier{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchData(String collection)async{
    QuerySnapshot querySnapshot = await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }



}