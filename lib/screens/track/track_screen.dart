import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

import '../../model/order.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  Future<Order>? _futureListOfOrders;

  @override
  void initState() {
    super.initState();
    _futureListOfOrders = context.read<OrderService>().trackParcels();
  }

  @override
  Widget build(BuildContext context) {
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

FutureBuilder<Order> buildFutureOrderTrackingBuilder() {
  return FutureBuilder<Order>(
    future: _futureListOfOrders,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return OrderRow(
          routeSuggestion: snapshot.data,
        );
      }
      return const CircularProgressIndicator();
    },
  );
}

class OrderRow extends StatelessWidget {
  const OrderRow({Key? key, required this.order}) : super(key: key);

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
