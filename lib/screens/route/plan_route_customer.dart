import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteCustomer extends StatelessWidget {
  const PlanRouteCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), isTrackPageOn: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text("Plan a route"),
                Spacer(),
                Text("Step 1 of 5"),
              ],
            ),
            Row(children: const [
              Text("Customer information"),
              Spacer(),
            ]),
            const TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Customer ID',
              ),
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
