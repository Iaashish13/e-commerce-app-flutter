import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';

class Headers extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.face,
            color: Colors.black,
            size: 28,
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 21,
              ),
            ),
           
            Text(
              (Provider.of<GetLocation>(context, listen: true).finalAddress),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            size: 28,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget headerText() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 16.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280.0),
        child: RichText(
          text: const TextSpan(
              text: 'What would you like ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'Yaldevi',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'to eat?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget headerMenu() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          foodCategory('All Foods'),
          foodCategory('Pizza'),
          foodCategory('Sausage'),
        ],
      ),
    );
  }

  Widget foodCategory(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: const BoxDecoration(
              color: kInActiveColor,
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
