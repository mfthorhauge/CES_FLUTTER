import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteConfirmation extends StatelessWidget {
  const PlanRouteConfirmation({Key? key}) : super(key: key);

  //final Customer customer;
  //final Parcel parcel;

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
                  "Step 5 of 5",
                  style: TextStyle(fontSize: 24.0, color: Colors.grey),
                ),
              ],
            ),
            const Text("Customer information"),
            Row(children: [
              Column(
                  //TODO: Use imported customer object to create information in panel
                  ),
              const Spacer(),
            ]),
            const Text("Parcel Information"),
            Row(children: [
              Column(
                  //TODO: Use imported parcel object to create information in panel
                  ),
              const Spacer(),
            ]),
            const Text("Origin/Destination"),
            Row(children: [
              Column(
                  //TODO: Use imported parcel object to create information in panel
                  ),
              const Spacer(),
              Column(
                  //TODO: Use imported parcel object to create information in panel
                  ),
            ]),
            const Text("Route"),
            Row(children: [
              Column(
                  //TODO: Use imported parcel object to create information in panel
                  ),
              const Spacer(),
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
                      '/routesuccess',
                    );
                  },
                  child: const Text("Confirm")),
            ]),
          ],
        ),
      ),
    );
  }
}
