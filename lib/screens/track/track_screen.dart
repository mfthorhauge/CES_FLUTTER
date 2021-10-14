import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Track a parcel"),
            ListView(
              children: const <Widget>[
                TrackListRow()
              ],
            ),
          ],
        )
      ),
    );
  }
}

class TrackListRow extends StatelessWidget {
  const TrackListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Customer"),
      Text("Origin"),
      Text("Destination"),
      Text("Duration"),
      Text("Tracking Number"),
      Text("Status"),
      Checkbox(value: false, onChanged: (bool? value) {})
    ]);
  }
}

