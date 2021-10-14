import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:telco_web_client/model/customer.dart';
import 'package:telco_web_client/model/parcel.dart';
import 'package:telco_web_client/model/route_suggestion.dart';

class OrderService with ChangeNotifier {
  Customer customer = Customer(0, "", "", "", "", "");
  Parcel parcel = Parcel(0, "", 0, 0, 0, 0, 0);
  Future<RouteSuggestion>? cheapestRouteSuggestion;
  Future<RouteSuggestion>? fastestRouteSuggestion;

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

  Future<RouteSuggestion> findCheapestRoute() async {
    final response = await http.post(
      Uri.parse(
          'http://wa-tl-t1.azurewebsites.net:80/routes/findCheapestRoute'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'CityFrom': "test",
        'CityTo': "test",
      }),
    );

    if (response.statusCode == 200) {
      return RouteSuggestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to parse route.');
    }
  }

  Future<RouteSuggestion> findFastestRoute() async {
    final response = await http.post(
      Uri.parse(
          'http://wa-tl-t1.azurewebsites.net:80/routes/findShortestRoute'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'CityFrom': "test",
        'CityTo': "test",
      }),
    );

    if (response.statusCode == 200) {
      return RouteSuggestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to parse route.');
    }
  }

  Future<RouteSuggestion> getCities() async {
    final response = await http.post(
      Uri.parse('http://wa-tl-t1.azurewebsites.net:80/routes/findFastestRoute'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'CityFrom': "test",
        'CityTo': "test",
      }),
    );

    if (response.statusCode == 200) {
      return RouteSuggestion.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to parse route.');
    }
  }
}
