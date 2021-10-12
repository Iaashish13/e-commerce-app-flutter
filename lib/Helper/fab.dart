import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';

class FAB extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: kActiveColor,
        child: const Icon(
        
          Icons.local_mall_outlined,
        
        ));
  }
}
