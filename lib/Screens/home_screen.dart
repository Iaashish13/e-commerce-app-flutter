import 'package:flutter/material.dart';
import 'package:pizmo/Helper/fab.dart';
import 'package:pizmo/Helper/headers.dart';
import 'package:pizmo/Helper/middle_helper.dart';

import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GetLocation>(context, listen: false).getCurrentLocation();
    //  context.read<Authentication>().authState;
    //  final firebaseUser = context.read<User?>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      floatingActionButton: FAB().floatingActionButton(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(),
              const Divider(),
              MiddleHelper().middleText(),
              MiddleHelper().getFavorite(context, "favourites"),
              MiddleHelper().bottomText(),
              MiddleHelper().getbusiness(context, "business"),
            ],
          ),
        ),
      ),
    );
  }
}
