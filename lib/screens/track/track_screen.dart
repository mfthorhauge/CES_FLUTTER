import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
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
      body: Center(
          child: Column(
        children: [
          const Text("Track a parcel"),
          // ListView(
          //   children: const <Widget>[
          //     TrackListRow()
          //   ],
          // ),
        ],
      )),
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
