import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// String? finalAddress = 'Searching Address';

class GetLocation with ChangeNotifier {
  String? _finalAddress = 'Searching Address';
 String?  _mainAdress = 'Fetching location';
  String get finalAddress => _finalAddress!;
  // String get countryName => _countryName;
  String get mainAdress => _mainAdress!;

  GoogleMapController? googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
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
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // ignore: avoid_print
    print(placemarks[0].name);
    // ignore: avoid_print
    print(placemarks[0].locality);
    var address = placemarks[0].street!;
    _finalAddress = address.toString();

    notifyListeners();
  }

  getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(markerId: markerId);
    // ignore: unused_label
    icon:
    BitmapDescriptor.defaultMarker;
    // ignore: unused_label
    infoWindow:
    const InfoWindow(title: 'My title', snippet: 'Country Name');
    markers[markerId] = marker;
  }

  fetchMaps() {
    return GoogleMap(
      myLocationEnabled: true,
      mapType: MapType.hybrid,
      onTap: (loc) async {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(loc.latitude, loc.longitude);
        _mainAdress = placemarks[0].street!;
        // _countryName = placemarks[0].subLocality!.toString();
        notifyListeners();
       getMarkers(loc.latitude, loc.longitude); 
        // ignore: avoid_print
        print(loc);
        // ignore: avoid_print
        print(_mainAdress);
      }, 
      markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController mapController) {
        googleMapController = mapController;
        notifyListeners();
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(
          21.000,
          45.000,
        ),
        zoom: 18,
      ),
    ); 
  }
}
