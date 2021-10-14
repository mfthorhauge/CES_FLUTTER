import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

enum PriceAdjustment { markup, discount }

class PlanRouteParcel extends StatelessWidget {
  const PlanRouteParcel({Key? key}) : super(key: key);
  final PriceAdjustment? _adjustment = PriceAdjustment.markup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), isPlanButtonDisabled: true,),
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
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a number",
                        labelText: "Number"),
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
                        border: OutlineInputBorder(),
                        hintText: "Grams",
                        labelText: "Weight"),
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
                        border: OutlineInputBorder(),
                        hintText: "Length in meters",
                        labelText: "Length"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Width in meters",
                        labelText: "Width"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Height in meters",
                        labelText: "Height"),
                  ),
                ),
              ),
            ]),
            Row(children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/route3',
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
