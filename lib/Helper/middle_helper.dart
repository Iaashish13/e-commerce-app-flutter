import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizmo/Screens/details_screen.dart';

import 'package:pizmo/Services/data.dart';
import 'package:provider/provider.dart';

class MiddleHelper extends ChangeNotifier {
  Widget middleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0),
      child: RichText(
        text: const TextSpan(
          text: 'Favourite ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            fontFamily: 'Yaldevi',
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'dishes',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'Yaldevi',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getFavorite(BuildContext context, String collection) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16),
      height: MediaQuery.of(context).size.height / 3.5,
      child: FutureBuilder(
        future: Provider.of<ManagingData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: DetailsScreen(
                            queryDocumentSnapshot: snapshot.data[index]),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    margin: const EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 6,
                            spreadRadius: 5,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130,
                          width: 170,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24)),
                            child: Image.network(
                              snapshot.data[index].data()['image'],
                              height: 120,
                              width: 160,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data[index].data()['Name'],
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Icon(Icons.favorite_outline),
                                  ]),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                snapshot.data[index].data()['category'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index]
                                            .data()['ratings']
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6.0,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: <Widget>[
                                      const Text(
                                        'Rs',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        snapshot.data[index]
                                            .data()['price']
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Widget getbusiness(BuildContext context, String collection) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: Provider.of<ManagingData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: DetailsScreen(
                            queryDocumentSnapshot: snapshot.data[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24.0))),
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data[index].data()['Name'],
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                snapshot.data[index].data()['category'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Rs',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    snapshot.data[index]
                                        .data()['price']
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                                topLeft: Radius.circular(24)),
                            child: Image.network(
                              snapshot.data[index].data()['image'],
                              height: 120,
                              width: 160,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Widget bottomText() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0),
      child: RichText(
        text: const TextSpan(
            text: 'Todays ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Yaldevi',
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'hot',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Yaldevi',
                ),
              ),
            ]),
      ),
    );
  }
}
