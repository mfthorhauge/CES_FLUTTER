import 'package:flutter/material.dart';

class PlanRouteParcel extends StatelessWidget {
  const PlanRouteParcel({Key? key}) : super(key: key);

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
            Row( children: const [
              Text("Amount"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child:  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Add a number"),
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
