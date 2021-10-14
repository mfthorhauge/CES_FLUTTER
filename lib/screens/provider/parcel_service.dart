import 'package:flutter/material.dart';
import 'package:telco_web_client/model/customer.dart';

class ParcelService with ChangeNotifier {
  Customer customer = Customer(0, "", "", "", "", "");

  void setCustomerId(String newValue) {
    customer.id = int.tryParse(newValue) ?? 0;
    notifyListeners();
  }
}
