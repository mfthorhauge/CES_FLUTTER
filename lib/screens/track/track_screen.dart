import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

import '../../model/order.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<Order>.generate(
        10,
        (i) => Order(
            "customer X", "origin", "destination", 10, 10, "done", "done"));

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isTrackButtonDisabled: true,
      ),
      body: Column(
        children: [
          const Text("Track a parcel"),
          // ListView.builder(
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     final item = items[index];
          //     return TrackListRow(parcel: item);
          //   },
          // )
        ],
      ),
    );
  }
}

class TrackListRow extends StatelessWidget {
  const TrackListRow({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(order.customer),
      Text(order.origin),
      Text(order.destination),
      Text(order.duration.toString()),
      Text(order.cost.toString()),
      Text(order.status),
      Checkbox(value: false, onChanged: (bool? value) {})
    ]);
  }
}
