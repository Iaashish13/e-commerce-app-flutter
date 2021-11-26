import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/details_screen.dart';
import 'package:pizmo/Services/data.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('myOrders');
      String? docID;
      Future getDocs()async {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('myOrders').get();
        for(int i=0; i< querySnapshot.docs.length; i++){
          var a =querySnapshot.docs[i];
          print(a);
        }
      }
      @override
  void initState() {
   getDocs();
    super.initState();
  }
      
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('myOrders').doc(docID).collection('orders').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String categoryy =
                          snapshot.data!.docs[index]['category'].toString();
                      final String id = snapshot.data!.docs[index].id;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                           
                            SizedBox(
                              child: Image.network(

                                snapshot.data!.docs[index]['image'],
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: <Widget>[
                            //     Text(
                            //       snapshot.data.docs[index]['name'],
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 20.0,
                            //       ),
                            //     ),
                            //     Text(
                            //       'Rs  ${snapshot.data.docs[index]['price'].toString()}',
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18.0,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //     Text(
                            //       categoryy == 'Pizza'
                            //           ? 'Onion:    ${snapshot.data.docs[index]['onion'].toString()}'
                            //           : 'No of Plates :         ${snapshot.data!.docs[index]['plates'].toString()}',
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18.0,
                            //       ),
                            //     ),
                            //     Text(
                            //       categoryy == 'Pizza'
                            //           ? 'Beacon:  ${snapshot.data.docs[index]['beacon'].toString()}'
                            //           : 'Special Chutney : ${snapshot.data.docs[index]['specialChutney'].toString()}',
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18.0,
                            //       ),
                            //     ),
                            //     Text(
                            //       categoryy == 'Pizza'
                            //           ? 'Cheese:  ${snapshot.data.docs[index]['cheese'].toString()}'
                            //           : 'Piro Chutney:        ${snapshot.data.docs[index]['piroChutney'].toString()}',
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18.0,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   width: 20,
                            // ),
                            // Container(
                            //   child: categoryy == 'Pizza'
                            //       ? CircleAvatar(
                            //           backgroundColor: kActiveColor,
                            //           child: Text(
                            //             snapshot.data.docs[index]['size'],
                            //             style: const TextStyle(
                            //               color: Colors.white,
                            //               fontSize: 18.0,
                            //             ),
                            //           ),
                            //         )
                            //       : Container(),
                            // ),
                            // IconButton(
                            //   onPressed: () {
                            //     Provider.of<ManagingData>(context,
                            //             listen: false)
                            //         .deleteData(context,
                            //             '${snapshot.data.docs[index]['name']}');
                            //     //  Provider.of<ManagingData>(context,listen: false).forOrder(context);
                            //   },
                            //   icon: const Icon(
                            //     Icons.delete,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  
}
