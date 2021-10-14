import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/customer.dart';
import 'package:telco_web_client/provider/order_service.dart';

class PlanRouteCustomer extends StatefulWidget {
  const PlanRouteCustomer({Key? key}) : super(key: key);

  @override
  _PlanRouteCustomerState createState() => _PlanRouteCustomerState();
}

class _PlanRouteCustomerState extends State<PlanRouteCustomer> {
  Customer customer = Customer(0, "", "", "", "", "");

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
                Text(
                  "Step 1 of 5",
                  style: TextStyle(fontSize: 24.0, color: Colors.grey),
                ),
              ],
            ),
            Row(children: const [
              Text(
                "Customer information",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Spacer(),
            ]),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Customer ID',
                      ),
                      onChanged: (text) =>
                          context.read<OrderService>().setCustomerId(text),
                      keyboardType: TextInputType.number),
                ),
                const Spacer()
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
