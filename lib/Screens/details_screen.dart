import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Providers/calculations.dart';
import 'package:pizmo/Screens/cart_screen.dart';
import 'package:pizmo/Screens/login_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  const DetailsScreen({Key? key, required this.queryDocumentSnapshot})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final int _totalItems = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButtonD(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            appBar(context),
            selectedImage(context),
            itemDetails(context),
            footerDetails(context),
          ],
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
            icon: const Icon(Icons.arrow_back_ios_new)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            onPressed: () {
              context.read<Calculations>().resetData();
            },
            child: const Text(
              'Reset',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            style: TextButton.styleFrom(
              primary: kActiveColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget selectedImage(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          widget.queryDocumentSnapshot['image'],
        ),
      ),
    );
  }

  Widget itemDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                widget.queryDocumentSnapshot['ratings'].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            widget.queryDocumentSnapshot['Name'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Text(
                widget.queryDocumentSnapshot['category'],
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const Text(
                'Rs',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                widget.queryDocumentSnapshot['price'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget footerDetails(BuildContext context) {
    if (widget.queryDocumentSnapshot['category'] == 'Snacks') {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 8, right: 8),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 8,
                ),
                child: Text(
                  'Add more Stuff',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              addingItems(
                  'No. of Plates',
                  '${Provider.of<Calculations>(context, listen: true).getNoOfPlates}'
                      .toString(), () {
                Provider.of<Calculations>(context, listen: false)
                    .minusnoOfPlates();
              }, () {
                Provider.of<Calculations>(context, listen: false)
                    .addnoOfPlates();
              }),
              addingItems(
                  'Special Chutney',
                  '${Provider.of<Calculations>(context, listen: true).getNoOfSpecialChutney}'
                      .toString(), () {
                Provider.of<Calculations>(context, listen: false)
                    .minusSpecialChutney();
              }, () {
                Provider.of<Calculations>(context, listen: false)
                    .addChilyChutney();
              }),
              addingItems(
                'Chilly Chutney',
                '${Provider.of<Calculations>(context, listen: true).getNoOfPiroChutney}'
                    .toString(),
                () {
                  Provider.of<Calculations>(context, listen: false)
                      .minusChilyChutney();
                },
                () {
                  Provider.of<Calculations>(context, listen: false)
                      .addChilyChutney();
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
        // height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                  color: Colors.white),
              // height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60.0, left: 8.0),
                    child: Text(
                      'Add more Stuff',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  addingItems(
                      'Cheese',
                      '${context.watch<Calculations>().getCheeseValue}'
                          .toString(), () {
                    context.read<Calculations>().minusCheeseValue();
                  }, () {
                    context.read<Calculations>().addCheeseValue();
                  }),
                  addingItems(
                    'Beacon',
                    '${Provider.of<Calculations>(context, listen: true).getbeaconValue}'
                        .toString(),
                    () {
                      Provider.of<Calculations>(context, listen: false)
                          .minusBeaconValue();
                    },
                    () {
                      Provider.of<Calculations>(context, listen: false)
                          .addBeaconValue();
                    },
                  ),
                  addingItems(
                    'Onions',
                    '${Provider.of<Calculations>(context, listen: true).getonionsValue}'
                        .toString(),
                    () {
                      Provider.of<Calculations>(context, listen: false)
                          .minusOnionsValue();
                    },
                    () {
                      Provider.of<Calculations>(context, listen: false)
                          .addOnionsValue();
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                sizeButton(
                  context,
                  'S',
                  () {
                    context.read<Calculations>().selectSmallSize();
                  },
                  context.watch<Calculations>().smallSelected
                      ? kActiveColor
                      : kInActiveColor,
                ),
                const SizedBox(
                  width: 24.0,
                ),
                sizeButton(
                  context,
                  'M',
                  () {
                    context.read<Calculations>().selectMediumSize();
                  },
                  context.watch<Calculations>().mediumSelected
                      ? kActiveColor
                      : kInActiveColor,
                ),
                const SizedBox(
                  width: 24.0,
                ),
                sizeButton(
                  context,
                  'L',
                  () {
                    context.read<Calculations>().selectLargeSize();
                  },
                  context.watch<Calculations>().largeSelected
                      ? kActiveColor
                      : kInActiveColor,
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  Widget addingItems(
    String name,
    String value,
    VoidCallback onRemovePressed,
    VoidCallback onAddPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              IconButton(
                  onPressed: onRemovePressed,
                  icon: const Icon(
                    Icons.remove,
                    size: 22,
                  )),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                width: 2.0,
              ),
              IconButton(
                  onPressed: onAddPressed,
                  icon: const Icon(
                    Icons.add,
                    size: 22,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget floatingActionButtonD(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              context.read<Authentication>().authState;
              final firebaseUser = context.read<User?>();
              if (firebaseUser != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }

              // context.read<Calculations>().addtoCart(context, {
              //   'image': widget.queryDocumentSnapshot['image'],
              //   'name': widget.queryDocumentSnapshot['Name'],
              //   'price': widget.queryDocumentSnapshot['price'],
              //   'onion': context.read<Calculations>().getonionsValue,
              //   'beacon': context.read<Calculations>().getbeaconValue,
              //   'cheese': context.read<Calculations>().getCheeseValue,
              //   'size': context.read<Calculations>().getSize,

              // });
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
                  'Add to Cart',
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
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const CartScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.shopping_basket,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 1,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: kActiveColor,
                child: Text(
                  '$_totalItems',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget sizeButton(
      BuildContext context, String size, VoidCallback onPressed, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            width: 30,
            decoration: BoxDecoration(
                // color: kActiveColor,
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                size,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            )),
      ),
    );
  }
}
