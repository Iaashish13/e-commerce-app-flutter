import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/login_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            Navigator.pop(context);
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
    return  SizedBox(
      // height: 300,
     height: MediaQuery.of(context).size.height/2.2,
     
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
            shippingData(context, const Icon(Icons.location_on), 'Parshyang'),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const  LoginScreen()));
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
}
