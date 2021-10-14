import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteCustomer extends StatelessWidget {
  const PlanRouteCustomer({Key? key}) : super(key: key);

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
                Text(
                  "Plan a route",
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                Spacer(),
                Text("Step 1 of 5",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey
                  ),
                ),
              ],
            ),
            Row(children: const [
              Text("Customer information", style: TextStyle(
                fontSize: 20.0,
              ),),
              Spacer(),
            ]),
            Row(
              children: const [
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Customer ID',
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
            Row(
              children: [
                TextButton(
                  child: const Text('Create new user'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/newcustomer',
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
            Row(children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/route2',
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
