import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:provider/provider.dart';

class ManagingData with ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    await firebaseFirestore
        .collection('myOrders')
        .doc(Provider.of<Authentication>(context, listen: false).getuid)
        .set(data);
  }
}
