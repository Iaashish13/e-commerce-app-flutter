import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Services/data.dart';
import 'package:provider/provider.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0,
      beaconValue = 0,
      onionsValue = 0,
      noOfPlates = 0,
      noOfSpecialChutney = 0,
      noOfPiroChutney = 0,
      cartData = 0;

  bool isSelected = false,
      smallSelected = false,
      mediumSelected = true,
      largeSelected = false,
      selected = false;
  String size ='';
 String get getSize =>size;
  int get getCheeseValue => cheeseValue;
  int get getbeaconValue => beaconValue;
  int get getonionsValue => onionsValue;
  int get getNoOfPlates => noOfPlates;
  int get getNoOfSpecialChutney => noOfSpecialChutney;
  int get getNoOfPiroChutney => noOfPiroChutney;
  int get getCartData => cartData;
  bool get getSelected => selected;

  addCheeseValue() {
    cheeseValue++;
    notifyListeners();
  }

  minusCheeseValue() {
    cheeseValue--;
    notifyListeners();
  }

  addBeaconValue() {
    beaconValue++;
    notifyListeners();
  }

  minusBeaconValue() {
    beaconValue--;
    notifyListeners();
  }

  addOnionsValue() {
    onionsValue++;
    notifyListeners();
  }

  minusOnionsValue() {
    onionsValue--;
    notifyListeners();
  }

  addnoOfPlates() {
    noOfPlates++;
    notifyListeners();
  }

  minusnoOfPlates() {
    noOfPlates--;
    notifyListeners();
  }

  addSpecialChutney() {
    noOfSpecialChutney++;
    notifyListeners();
  }

  minusSpecialChutney() {
    noOfSpecialChutney--;
    notifyListeners();
  }

  addChilyChutney() {
    noOfPiroChutney++;
    notifyListeners();
  }

  minusChilyChutney() {
    noOfPiroChutney--;
    notifyListeners();
  }

  selectSmallSize() {
    smallSelected = true;
    mediumSelected = false;
    largeSelected = false;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize() {
    mediumSelected = true;
    smallSelected = false;
    largeSelected = false;
    size  = 'M';
    notifyListeners();
  }

  selectLargeSize() {
    largeSelected = true;
    smallSelected = false;
    mediumSelected = false;
    size = 'L';
    notifyListeners();
  }
  resetData(){
    cheeseValue = 0;
      beaconValue = 0;
      onionsValue = 0;
      noOfPlates = 0;
      noOfSpecialChutney = 0;
      noOfPiroChutney = 0;
      cartData = 0;
      largeSelected = false;
    smallSelected = false;
    mediumSelected = false;
      
      notifyListeners();

  }

  addtoCart(BuildContext context, dynamic data) async {
    if (smallSelected != false ||
        mediumSelected != false ||
        largeSelected != false) {
      cartData++;
     
      await Provider.of<ManagingData>(context, listen: false)
          .submitData(context, data);
          notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Please Select Size',
                ),
              ),
            );
          });
    }
  }
}
