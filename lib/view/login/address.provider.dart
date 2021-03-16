import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  String _area;
  String _doorNumber;
  String _address;
  String _nearByAddress;

  List<String> _pallapttiStreets = [
    'Puliyamara Street',
    'Dindigul Road',
    'Mongan Street',
    'Christian Street',
    'Harijanastreet',
    'Kanappa Street',
    'R.C.Street',
    'P G Road',
    'Kaleesstreet',
    'Marakkayar Street',
    'Meer Ismail Street',
    'Rajapettai Street',
    'Soundirapuram',
    'Tamil Nagar',
    'Big Bazaar',
    'Big Pallivasal Street',
    'Chinna Kadai Street',
    'Kaliba Sahib Street',
    'Katta Mohamed Street',
    'Koil Street',
    'Kumaran Street',
    'Mariamman Koil Street',
    'Market Street',
    'Omaiyan Street',
    'Pattani Street',
    'Sukkankuli Street',
    'Thaikkal Street',
    'Vyali Street',
    'Aziz Sahib Street',
    'Chinna Odai Street',
    'New Sahib Street',
    'Poonaikannan Street',
    'Santhaipettai Street',
    'South Manthai Street',
    'Azad Nagar',
    'Deen Nagar',
    'M G R Nagar',
    'Karuthappa Street',
    'Lebbai Sahib Street',
    'Anna Nagar',
    'Cresent Nagar',
    'Kanakkupillai Street',
    'New Mariamman Koil Street',
    'Semian Street',
    'Thottakaran Street',
    'K R Nagar',
    'Big Odai Street',
    'Minister Street',
    'S C I Street',
    'South Street',
    'Thawakayan Street',
    'Urus Kadai Street',
    'Rasool Nagar',
    'Pookkaran Street',
    'Selathi Street',
    'Urusu Street',
    'Zinna Street',
    'J P S Colony',
    'Mamanji Street',
    'Meera Bava Street',
    'New Pattani Street',
    'Savvas Street',
    'Virupachiyan Street',
    'Podur Soundrapuram',
  ];

  String get area => _area;
  String get doorNumber => _doorNumber;
  String get address => _address;
  String get naerByAddress => _nearByAddress;

  List<String> get streets => _pallapttiStreets;
  bool get valid => _area != null && _doorNumber != null;

  void changeArea(String value) {
    _area = value;
    notifyListeners();
  }

  void changeDoorNum(String value) {
    _doorNumber = value;
    notifyListeners();
  }

  void changeNearByAddress(String value) {
    _nearByAddress = value;
    notifyListeners();
  }
}