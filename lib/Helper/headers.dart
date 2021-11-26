import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/details_screen.dart';
import 'package:pizmo/Screens/home_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Headers extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    // context.read<Authentication>().authState;
    // final firebaseUser = context.read<User?>();
    var currentUser =FirebaseAuth.instance.currentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        currentUser == null
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.face,
                  size: 28,
                  color: Colors.black,
                ),
              )
            : IconButton(
                onPressed: () async {
                  await showAlertDialogB(context);
                },
                icon: const Icon(
                  Icons.logout,
                  size: 28,
                  color: Colors.black,
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

  showAlertDialogB(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Sign Out ?'),
              content: const Text('Do you want to Sign out ?'),
              actions: [
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('uid');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                )
              ],
            ));
  }
}
