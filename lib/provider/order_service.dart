import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:telco_web_client/model/address.dart';
import 'package:telco_web_client/model/city.dart';
import 'package:telco_web_client/model/customer.dart';
import 'package:telco_web_client/model/employee.dart';
import 'package:telco_web_client/model/parcel.dart';
import 'package:telco_web_client/model/route_suggestion.dart';

class OrderService with ChangeNotifier {
  Employee employee = Employee("", "", "");
  Customer customer = Customer(
    city: '',
    email: '',
    id: 0,
    address: '',
    name: '',
    postcode: '',
  );
  Parcel parcel = Parcel(0, "", 0, 0, 0, 0, 0);
  Address origin = Address("", "", "", "");
  Address destination = Address("", "", "", "");
  Future<RouteSuggestion>? cheapestRouteSuggestion;
  Future<RouteSuggestion>? fastestRouteSuggestion;

  //Customer get getCustomer => customer;

  Parcel get getParcel => parcel;

  Address get getOrigins => origin;

  Address get getDestination => destination;

  Employee get getEmployee => employee;

  void setCustomerId(String newValue) {
    customer.id = int.tryParse(newValue) ?? 0;
    notifyListeners();
  }

  void setEmployee(Employee employee) {
    this.employee = employee;
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

  void setOrigin(Address address) {
    origin = address;
    notifyListeners();
    print("Origin name: " + (origin.name));
    print("Origin address: " + (origin.address));
    print("Origin city: " + (origin.city));
    print("Origin country: " + (origin.country));
  }

  void setDestion(Address address) {
    destination = address;
    notifyListeners();
    print("Destination name: " + (destination.name));
    print("Destination address: " + (destination.address));
    print("Destination city: " + (destination.city));
    print("Destination country: " + (destination.country));
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

  List<City> parseCities(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<City>((json) => City.fromJson(json)).toList();
  }

  Future<List<City>> getCities() async {
    final response = await http.get(
      Uri.parse('http://wa-tl-t1.azurewebsites.net:80/routes/getCities'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return parseCities(response.body);
    } else {
      throw Exception('Failed to parse route.');
    }
  }

  //TODO: Make it so getCustomer dynamic and not fixed to nr. 1.
  void getCustomer() async {
    final response = await http.get(
      Uri.parse(
          'http://wa-tl-t1.azurewebsites.net:80/login/GetCustomer?request=1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      customer = Customer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to parse customer.');
    }
  }
}
