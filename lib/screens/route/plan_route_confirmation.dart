import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';

class PlanRouteConfirmation extends StatelessWidget {
  const PlanRouteConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        isPlanButtonDisabled: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text("Plan a route"),
                Spacer(),
                Text("Step 5 of 5"),
              ],
            ),
            const Text("Customer information"),
            Row(children: [
              Column(

              ),
              const Spacer(),
            ]),
            const Text("Parcel Information"),

            Row(children: [
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/routeSuccess',
                    );
                  },
                  child: const Text("Confirm")),
            ]),
          ],
        ),
      ),
    );
  }
}


