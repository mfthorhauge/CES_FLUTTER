import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class CreateCustomer extends StatelessWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar()),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Create new customer"),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Column(children: [
                    const Text("Customer information"),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Name'),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Email'),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Address'),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Postcode'),
                    ),
                    DropdownButton(
                      items: <String>[
                        'City1',
                        'City2',
                        'City3',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Country'),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const Text("Billing information"),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Card holder name'),
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 180,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Credit Card Number'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'CVV'),
                            ),
                          ),
                        ],
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Expiration date (YYYY/MM)'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Create New Customer")),
            ],
          ),
        ],
      )),
    );
  }
}
