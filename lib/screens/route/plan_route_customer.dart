import 'package:flutter/material.dart';

class PlanRouteCustomer extends StatelessWidget {
  const PlanRouteCustomer({Key? key}) : super(key: key);

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
                    Navigator.popAndPushNamed(
                      context,
                      '/createCustomer',
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
