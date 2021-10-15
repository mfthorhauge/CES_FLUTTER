import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/provider/order_service.dart';

import '../../model/order.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  Future<List<Order>>? _futureListOfOrders;

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
      body:
          Column(children: [Center(child: buildFutureOrderTrackingBuilder())]),
    );
  }

  FutureBuilder<List<Order>> buildFutureOrderTrackingBuilder() {
    return FutureBuilder<List<Order>>(
      future: _futureListOfOrders,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return OrderRow(
                order: snapshot.data![index],
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class OrderRow extends StatelessWidget {
  const OrderRow({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(order.employee),
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
