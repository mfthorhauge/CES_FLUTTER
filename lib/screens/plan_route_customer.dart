import 'package:flutter/material.dart';

class PlanRouteCustomer extends StatelessWidget {
  const PlanRouteCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Customer ID',
            ),
          ),
          TextButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/route1',
              );
            },
          ),
        ]),
      ),
    );
  }
}
