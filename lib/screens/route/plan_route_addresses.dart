import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteAddresses extends StatelessWidget {
  const PlanRouteAddresses({Key? key}) : super(key: key);

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
                Text("Step 3 of 5"),
              ],
            ),
            Row(children: const [
              Text("Origin"),
              Spacer(),
              Text("Destination")
            ]),
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Sender",
                        labelText: "Sender"),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Receiver",
                        labelText: "Receiver"),
                  ),
                ),
              ),
            ]),
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Address",
                        labelText: "Address"),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Address",
                        labelText: "Address"),
                  ),
                ),
              ),
            ]),
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Postcode",
                        labelText: "Postcode"),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Postcode",
                        labelText: "Postcode"),
                  ),
                ),
              ),
            ]),
            //TODO: These two boxes should be dropdown menues based on the city entities.
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "- Select a city -",
                        labelText: "City"),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "- Select a city -",
                        labelText: "City"),
                  ),
                ),
              ),
            ]),
            //TODO: Same as billing address import for information fields in form. Needs extra endpoint.
            Row(children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text("Back")),
              //TODO: Pushing this button should call the calculate route method, the routes are displayed on the next page.
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/route4',
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
