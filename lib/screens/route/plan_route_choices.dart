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
              const Text("Route options"),
              buildFutureFastestBuilder(),
              buildFutureCheapestBuilder(),
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

  FutureBuilder<RouteSuggestion> buildFutureFastestBuilder() {
    return FutureBuilder<RouteSuggestion>(
      future: _futureFastestRouteSuggestion,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PossibleRouteRow(
            routeSuggestion: snapshot.data,
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
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class PossibleRouteRow extends StatelessWidget {
  const PossibleRouteRow({Key? key, this.routeSuggestion}) : super(key: key);

  final RouteSuggestion? routeSuggestion;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(routeSuggestion?.origin ?? ""),
      Text(routeSuggestion?.destination ?? ""),
      Text(routeSuggestion?.cost.toString() ?? ""),
      Text(routeSuggestion?.duration.toString() ?? ""),
    ]);
  }
}
