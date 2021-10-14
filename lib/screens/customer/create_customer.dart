import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class CreateCustomer extends StatelessWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), isTrackPageOn: false,),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Create new customer"),
          Column(children: [
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
            DropdownButton(items: <String>[
              'City1',
              'City2',
              'City3',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color:Colors.black),),
              );
            }).toList(),)
          ],)
        ]),
      ),
    );
  }
}
