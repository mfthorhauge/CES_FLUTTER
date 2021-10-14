import 'package:flutter/material.dart';

class CreateCustomer extends StatelessWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Create new customer"),
          Row(children: [
            Column(children: [
              Text("Customer information"),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Address'),
              )
            ],)
          ],)
        ]),
      ),
    );
  }
}
