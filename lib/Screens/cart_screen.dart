import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esewa_pnp/esewa.dart';

import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/details_screen.dart';

import 'package:pizmo/Screens/map_screen.dart';

import 'package:pizmo/Services/data.dart';
import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ESewaPnp? _eSewaPnp;
  ESewaConfiguration? _configuration;
  @override
  void initState() {
    _configuration = ESewaConfiguration(
        clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        environment: ESewaConfiguration.ENVIRONMENT_TEST);
    _eSewaPnp = ESewaPnp(configuration: _configuration!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(context),
              headerText(context),
              cartData(context),
              shippingDetails(),
              billingData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // Provider.of<ManagingData>(context, listen: false).forOrder(context);
          },
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }

  Widget headerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: const <Widget>[
          Text(
            'Your',
            style: TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            'Cart',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ],
      ),
    );
  }

  Widget cartData(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.2,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('myOrders')
            .doc(userUid)
            .collection('orders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                          snapshot.data.docs[index]['image'],
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            snapshot.data.docs[index]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Rs  ${snapshot.data.docs[index]['price'].toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Onion:    ${snapshot.data.docs[index]['onion'].toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'Beacon:  ${snapshot.data.docs[index]['beacon'].toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'Cheese:  ${snapshot.data.docs[index]['cheese'].toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: kActiveColor,
                        child: Text(
                          snapshot.data.docs[index]['size'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<ManagingData>(context, listen: false)
                              .deleteData(context,
                                  '${snapshot.data.docs[index]['name']}');
                          //  Provider.of<ManagingData>(context,listen: false).forOrder(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget shippingDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          children: <Widget>[
            shippingData(context, const Icon(Icons.location_on),
                context.watch<GetLocation>().mainAdress),
            shippingData(
                context, const Icon(Icons.schedule_outlined), '30-35 mins'),
          ],
        ),
      ),
    );
  }

  Widget shippingData(BuildContext context, Icon icon, String data) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(
            width: 6,
          ),
          Text(
            data,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text(
                  'SubTotal',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'Rs',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '300',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: const <Widget>[
                Text(
                  'Delivery Charges',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'Rs',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '50',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: const <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Text(
                  'Rs',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  '300',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              'Cash on Delivery',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            onPressed: () {},
                          ),
                          ESewaPaymentButton(_eSewaPnp!,
                              amount: 10,
                              productId: '1233',
                              productName: 'Chicken Pizza',
                              callBackURL: 'https:/www.google.com',
                              onSuccess: (result) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildSnackbar(
                                    const Color.fromRGBO(65, 161, 36, 1),
                                    result.message!));
                          }, onFailure: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                buildSnackbar(Colors.red, e.message!));
                          }),
                          // TextButton(
                          //   child: const Text(
                          //     'Pay with esewa',
                          //     style:
                          //         TextStyle(color: Colors.black, fontSize: 20),
                          //   ),
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 45.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: kActiveColor),
              child: const Center(
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildSnackbar(
    Color color,
    String msg,
  ) {
    return SnackBar(
      content: Text(msg),
      backgroundColor: color,
    );
  }
}
