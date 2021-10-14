import 'package:flutter/material.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/route_suggestions.dart';

//TODO: Should make a list that display atleast 1 possible route and maximum of three routes
class PlanRouteChoices extends StatelessWidget {
  const PlanRouteChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //TODO: Create  list of possible routes based on calculation endpoint.
    final items = List<RouteSuggestion>.generate(
        10, (i) => RouteSuggestion("origin", "Destination", "Duration", "Cost")
    );

    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), isTrackPageOn: false,),
      body: Column(
        children: const [
          Text ("Possible Routes"),

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

class PossibleRouteRow extends StatelessWidget {
  const PossibleRouteRow({Key? key, required this.routeSuggestion}) : super(key: key);

  final RouteSuggestion routeSuggestion;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(routeSuggestion.origin),
      Text(routeSuggestion.destination),
      Text(routeSuggestion.cost),
      Text(routeSuggestion.duration),
    ]);
  }
}
