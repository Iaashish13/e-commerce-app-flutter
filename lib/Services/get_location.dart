import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

String finalAddress = 'Searching Address';

class GetLocation extends ChangeNotifier {
  String _finalAddress = 'Searching Address';
  String get finalAddress => _finalAddress;
  Future getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disable');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Future.error(
          'Permission are denied permanently, we cannot request permission');
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks[0].street);
    // ignore: avoid_print
    print(placemarks[0].name);
    var address = placemarks[0].street;
    _finalAddress = address.toString();

    notifyListeners();
  }
}
