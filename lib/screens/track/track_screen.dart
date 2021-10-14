import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

import '../../model/parcel.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final items = List<Parcel>.generate(
      10, (i) => Parcel("customer X", "origin", "destination", "10", "ABC", "done", "done")
    );

    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(),),
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
  const TrackListRow({Key? key, required this.parcel}) : super(key: key);

  final Parcel parcel;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(parcel.customer),
      Text(parcel.origin),
      Text(parcel.destination),
      Text(parcel.destination),
      Text(parcel.trackingNumber),
      Text(parcel.status),
      Checkbox(value: false, onChanged: (bool? value) {})
    ]);
  }
}
