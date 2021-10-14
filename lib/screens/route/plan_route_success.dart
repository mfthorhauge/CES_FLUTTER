import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteSuccess extends StatelessWidget {
  const PlanRouteSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isPlanButtonDisabled: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Plan a route"),
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  color: Colors.lightGreenAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  const Text(
                      "All parcel information has been received successfully!"),
                  Row(children: [
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/track");
                        },
                        child: const Text("Track Parcel")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/route1");
                        },
                        child: const Text("Add new parcel")),
                    const Spacer(),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
