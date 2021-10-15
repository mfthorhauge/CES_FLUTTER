import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/provider/order_service.dart';

class PlanRouteConfirmation extends StatelessWidget {
  const PlanRouteConfirmation({Key? key}) : super(key: key);

  //final Customer customer;
  //final Parcel parcel;

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
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text("Plan a route",
                      style: TextStyle(
                        fontSize: 32.0,
                      )),
                  Spacer(),
                  Text(
                    "Step 5 of 5",
                    style: TextStyle(fontSize: 24.0, color: Colors.grey),
                  ),
                ],
              ),
              const Text("Customer information"),
              Row(children: [
                Container(
                  width: 300,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Text(context.watch<OrderService>().customer.name),
                      Text(context.watch<OrderService>().customer.address),
                      Text(context.watch<OrderService>().customer.postcode),
                      Text(context.watch<OrderService>().customer.city),
                    ],
                  ),
                ),
                const Spacer(),
              ]),
              const Text("Parcel Information"),
              Row(children: [
                Container(
                  width: 300,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Text(context.watch<OrderService>().parcel.category),
                      Text(context
                          .watch<OrderService>()
                          .parcel
                          .amount
                          .toString()),
                      Text(context
                          .watch<OrderService>()
                          .parcel
                          .weight
                          .toString()),
                    ],
                  ),
                ),
                const Spacer(),
              ]),
              const Text("Origin/Destination"),
              Row(children: [
                Container(
                  width: 300,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Text(context.watch<OrderService>().origin.name),
                      Text(context.watch<OrderService>().origin.address),
                      Text(context.watch<OrderService>().origin.city),
                      Text(context.watch<OrderService>().origin.country),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Column(children: [
                    Text(context.watch<OrderService>().destination.name),
                    Text(context.watch<OrderService>().destination.address),
                    Text(context.watch<OrderService>().destination.city),
                    Text(context.watch<OrderService>().destination.country),
                  ]),
                ),
              ]),
              const Text("Route"),
              Container(
                width: 300,
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Row(children: [
                  Text(context
                          .watch<OrderService>()
                          .selectedRouteSelection
                          ?.origin ??
                      ""),
                  Text(context
                          .watch<OrderService>()
                          .selectedRouteSelection
                          ?.destination ??
                      ""),
                  const Spacer(),
                ]),
              ),
              Row(children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text("Back")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<OrderService>()
                            .saveOrder()
                            .then((value) => {
                                  Navigator.pushNamed(
                                    context,
                                    '/routesuccess',
                                  )
                                });
                      },
                      child: const Text("Confirm")),
                ),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
