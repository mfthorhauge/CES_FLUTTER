import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:telco_web_client/components/custom_app_bar.dart';
import 'package:telco_web_client/model/route_suggestion.dart';
import 'package:telco_web_client/provider/order_service.dart';

//TODO: Should make a list that display atleast 1 possible route and maximum of three routes
class PlanRouteChoices extends StatefulWidget {
  const PlanRouteChoices({Key? key}) : super(key: key);

  @override
  State<PlanRouteChoices> createState() => _PlanRouteChoicesState();
}

class _PlanRouteChoicesState extends State<PlanRouteChoices> {
  Future<RouteSuggestion>? _futureCheapestRouteSuggestion;
  Future<RouteSuggestion>? _futureFastestRouteSuggestion;

  bool isCheapestSelected = false;
  bool isFastestSelected = false;

  @override
  void initState() {
    super.initState();
    _futureCheapestRouteSuggestion =
        context.read<OrderService>().findCheapestRoute();
    _futureFastestRouteSuggestion =
        context.read<OrderService>().findFastestRoute();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Plan a route",
                      style: TextStyle(
                        fontSize: 32.0,
                      )),
                  Spacer(),
                  Text(
                    "Step 4 of 5",
                    style: TextStyle(fontSize: 24.0, color: Colors.grey),
                  ),
                ],
              ),
              const Text(
                "Route options",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Row(
                children: const [
                  Text("Fastest route"),
                  Spacer(),
                  Text("Duration"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cost"),
                  ),
                ],
              ),
              buildFutureFastestBuilder(),
              Row(
                children: const [
                  Text("Cheapest route"),
                  Spacer(),
                  Text("Duration"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cost"),
                  ),
                ],
              ),
              buildFutureCheapestBuilder(),
              Row(children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text("Back")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/route5',
                        );
                      },
                      child: const Text("Next Step")),
                ),
              ]),
            ],
          ),
        ));
  }

  FutureBuilder<RouteSuggestion> buildFutureFastestBuilder() {
    return FutureBuilder<RouteSuggestion>(
      future: _futureFastestRouteSuggestion,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PossibleRouteRow(
            routeSuggestion: snapshot.data,
            isSelected: isFastestSelected,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<RouteSuggestion> buildFutureCheapestBuilder() {
    return FutureBuilder<RouteSuggestion>(
      future: _futureCheapestRouteSuggestion,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PossibleRouteRow(
            routeSuggestion: snapshot.data,
            isSelected: isCheapestSelected,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class PossibleRouteRow extends StatefulWidget {
  const PossibleRouteRow(
      {Key? key, this.routeSuggestion, required this.isSelected})
      : super(key: key);

  final RouteSuggestion? routeSuggestion;
  final bool isSelected;

  @override
  State<PossibleRouteRow> createState() => _PossibleRouteRowState();
}

class _PossibleRouteRowState extends State<PossibleRouteRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.routeSuggestion?.origin ?? ""),
          ),
          Text(widget.routeSuggestion?.destination ?? ""),
          const Spacer(),
          Text(widget.routeSuggestion?.cost.toString() ?? ""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.routeSuggestion?.duration.toString() ?? ""),
          ),
        ]),
      ),
    );
  }
}
