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
            Row(children: [
              const Spacer(),
              //TODO: origin address
              Column(children: const [
                Text("Origin"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Sender",
                          labelText: "Name"),
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
                          hintText: "Address",
                          labelText: "Address"),
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
                          hintText: "- Select a city -",
                          labelText: "City"),
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
                          hintText: "Country",
                          labelText: "Country"),
                    ),
                  ),
                ),
              ]),
              Column(children: const [
                Text("Destination"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Receiver",
                          labelText: "Name"),
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
                          hintText: "Address",
                          labelText: "Address"),
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
                          hintText: "- Select a city -",
                          labelText: "City"),
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
