import 'package:flutter/material.dart';
import 'package:telco_web_client/model/customer.dart';
import 'package:telco_web_client/model/parcel.dart';

class OrderService with ChangeNotifier {
  Customer customer = Customer(0, "", "", "", "", "");
  Parcel parcel = Parcel(0, "", 0, 0, 0, 0, 0);

  void setCustomerId(String newValue) {
    customer.id = int.tryParse(newValue) ?? 0;
    notifyListeners();
  }

  //TODO: In a future release, this is where validation could be.
  void setParcel(Parcel parcel) {
    this.parcel = parcel;
    notifyListeners();
    print("Length: " + (parcel.length.toString()));
    print("Width: " + (parcel.width.toString()));
    print("Height: " + (parcel.height.toString()));
    print("Weight: " + (parcel.weight.toString()));
    print("Amount: " + (parcel.amount.toString()));
    print("Priceadjustement: " + (parcel.priceAdjustment.toString()));
  }
}
