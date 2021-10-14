import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/route_suggestion.dart';

//TODO: Should make a list that display atleast 1 possible route and maximum of three routes
class PlanRouteChoices extends StatelessWidget {
  const PlanRouteChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
          isPlanButtonDisabled: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Row(
                children: const [
                  Text("Plan a route",
                      style: TextStyle(
                        fontSize: 32.0,
                      )),
                  Spacer(),
                  Text("Step 4 of 5"),
                ],
              ),
              Text("Route options"),
              // ListView.builder(
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     final item = items[index];
              //     return TrackListRow(parcel: item);
              //   },
              // )
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
                        '/route5',
                      );
                    },
                    child: const Text("Next Step")),
              ]),
            ],
          ),
        ));
  }
}

class PossibleRouteRow extends StatelessWidget {
  const PossibleRouteRow({Key? key, required this.routeSuggestion})
      : super(key: key);

  final RouteSuggestion routeSuggestion;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(routeSuggestion.origin),
      Text(routeSuggestion.destination),
      Text(routeSuggestion.cost.toString()),
      Text(routeSuggestion.duration.toString()),
    ]);
  }
}
