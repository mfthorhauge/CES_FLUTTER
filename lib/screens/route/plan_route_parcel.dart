import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/parcel.dart';
import 'package:telco_web_client/provider/order_service.dart';

enum PriceAdjustment { markup, discount }

class PlanRouteParcel extends StatefulWidget {
  const PlanRouteParcel({Key? key}) : super(key: key);

  @override
  _PlanRouteParcelState createState() => _PlanRouteParcelState();
}

class _PlanRouteParcelState extends State<PlanRouteParcel> {
  Parcel parcel = Parcel(0, "", 0, 0, 0, 0, 0);

  final PriceAdjustment? _adjustment = PriceAdjustment.markup;

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
                  "Step 2 of 5",
                  style: TextStyle(fontSize: 24.0, color: Colors.grey),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              Text("Parcel information"),
            ]),
            Row(children: [
              const Text("Amount"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.amount = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a number",
                        labelText: "Amount"),
                  ),
                ),
              ),
            ]),
            //TODO: Need to connect with backend endpoint
            Row(children: const [
              Text("Category"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "- Select a category - ",
                        labelText: "Category"),
                  ),
                ),
              ),
            ]),
            //TODO: Fix radio buttons for price adjustment.
            /*Row( children: [
              const Text("Price adjustment"),
              ListTile(
                title: const Text("Markup"),
                leading: Radio<PriceAdjustment>(
                  value: PriceAdjustment.markup,
                  groupValue: _adjustment,
                  onChanged: (PriceAdjustment? value) {
                  },
                ),
              ),
              ListTile(
                title: const Text("Discount"),
                leading: Radio<PriceAdjustment>(
                  value: PriceAdjustment.discount,
                  groupValue: _adjustment,
                  onChanged: (PriceAdjustment? value) {
                  },
                ),
              ),
            ]),
            */
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.priceAdjustment = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a price adjustment",
                        labelText: "Number"),
                  ),
                ),
              ),
            ]),
            Row(children: [
              const Text("Weight"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.weight = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Grams",
                        labelText: "Weight"),
                  ),
                ),
              ),
            ]),
            Row(children: [
              const Text("Size"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.length = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Length in meters",
                        labelText: "Length"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.width = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Width in meters",
                        labelText: "Width"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      parcel.height = int.tryParse(text) ?? 0;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Height in meters",
                        labelText: "Height"),
                  ),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      context.read<OrderService>().setParcel(parcel);
                      Navigator.pushNamed(
                        context,
                        '/route3',
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
