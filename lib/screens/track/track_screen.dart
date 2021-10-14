import 'package:flutter/material.dart';

import '../../model/parcel.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final items = List<Parcel>.generate(
      10, (i) => Parcel("customer X", "origin", "destination", "10", "ABC", "done", "done")
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/route1");
              },
              child: const Text(
                'Plan route',
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Track Parcel',
                style: TextStyle(color: Colors.white),
              )),
        ],
        centerTitle: false,
        title: Image.asset(
          "assets/images/telstar.jpg",
          fit: BoxFit.contain,
          height: 40,
        ),
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
