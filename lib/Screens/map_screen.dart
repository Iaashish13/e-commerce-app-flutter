import 'package:flutter/material.dart';
import 'package:pizmo/Screens/cart_screen.dart';

import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            context.read<GetLocation>().fetchMaps(),
            Positioned(
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
