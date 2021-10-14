import 'package:flutter/material.dart';

enum PriceAdjustment { markup, discount }

class PlanRouteParcel extends StatelessWidget {
  const PlanRouteParcel({Key? key}) : super(key: key);
  final PriceAdjustment? _adjustment = PriceAdjustment.markup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text("Plan a route"),
                Spacer(),
                Text("Step 2 of 5"),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
              Text("Parcel information"),
            ]),
            Row(children: const [
              Text("Amount"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Add a number"),
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
                        hintText: "- Select a category - "),
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
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Add a number"),
                  ),
                ),
              ),
            ]),
            Row(children: const [
              Text("Weight"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Grams"),
                  ),
                ),
              ),
            ]),
            Row(children: const [
              Text("Size"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Length"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Width"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Height"),
                  ),
                ),
              ),
            ]),
            Row(children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/createCustomer',
                    );
                  },
                  child: const Text("Next Step")),
            ]),
          ],
        ),
      ),
    );
  }
}
