import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteSuccess extends StatelessWidget {
  const PlanRouteSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), isPlanButtonDisabled: true,),
      body: Center(
        child: Column(
          children: [
            const Text("Plan a route"),
            Container(
              color: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  const Text("All parcel information has been received successfully!"),
                  Row(children: [
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: const Text("Track Parcel")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
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
