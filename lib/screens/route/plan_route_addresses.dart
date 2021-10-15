import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/address.dart';
import 'package:telco_web_client/model/city.dart';
import 'package:telco_web_client/provider/order_service.dart';

class PlanRouteAddresses extends StatefulWidget {
  const PlanRouteAddresses({Key? key}) : super(key: key);

  @override
  _PlanRouteAddressesState createState() => _PlanRouteAddressesState();
}

class _PlanRouteAddressesState extends State<PlanRouteAddresses> {
  Address destinationAddress = Address("", "", "", "");
  Address originAddress = Address("", "", "", "");

  String? destinationCity;

  Future<List<City>>? cities;

  @override
  void initState() {
    super.initState();
    cities = context.read<OrderService>().getCities();
  }

  FutureBuilder<List<City>> buildFutureBuilder() {
    return FutureBuilder<List<City>>(
      future: cities,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButton<String>(
            onChanged: (String? value) {
              destinationCity = value;
            },
            value: destinationCity,
            items: snapshot.data != null
                ? snapshot.data!.map<DropdownMenuItem<String>>((City value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.displayName),
                    );
                  }).toList()
                : List.empty(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isPlanButtonDisabled: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text("Plan a route",
                    style: TextStyle(
                      fontSize: 32.0,
                    )),
                Spacer(),
                Text(
                  "Step 3 of 5",
                  style: TextStyle(fontSize: 24.0, color: Colors.grey),
                ),
              ],
            ),
            Row(children: [
              const Spacer(),
              Column(children: [
                const Text("Origin"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        originAddress.name = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Sender",
                          labelText: "Name"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        originAddress.address = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Address",
                          labelText: "Address"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        originAddress.city = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "- Select a city -",
                          labelText: "City"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        originAddress.country = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Country",
                          labelText: "Country"),
                    ),
                  ),
                ),
              ]),
              Column(children: [
                const Text("Destination"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        destinationAddress.name = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Receiver",
                          labelText: "Name"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        destinationAddress.address = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Address",
                          labelText: "Address"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: 300.0, child: buildFutureBuilder()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      onChanged: (text) {
                        destinationAddress.country = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Country",
                          labelText: "Country"),
                    ),
                  ),
                ),
              ]),
              const Spacer(),
              Column(
                  //TODO: Use imported customer object to create information in panel
                  ),
              const Spacer(),
            ]),
            Row(children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Text("Back")),
              ),
              //TODO: Store origin and destination address
              //TODO: Pushing this button should call the calculate route method, the routes are displayed on the next page.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      context.read<OrderService>().setOrigin(originAddress);
                      context
                          .read<OrderService>()
                          .setDestion(destinationAddress);
                      Navigator.pushNamed(
                        context,
                        '/route4',
                      );
                    },
                    child: const Text("Next Step")),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
