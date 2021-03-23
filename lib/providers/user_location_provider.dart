import 'package:flutter/cupertino.dart';

import '../model/address.dart';

class UserAddressProvider extends ChangeNotifier {
  Address currentAddress;

  void updateUserAddress(Address address) {
    currentAddress = address;
    notifyListeners();
  }
}
