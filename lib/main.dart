import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telco_web_client/provider/order_service.dart';
import 'package:telco_web_client/screens/customer/create_customer.dart';
import 'package:telco_web_client/screens/route/plan_route_addresses.dart';
import 'package:telco_web_client/screens/route/plan_route_choices.dart';
import 'package:telco_web_client/screens/route/plan_route_confirmation.dart';
import 'package:telco_web_client/screens/route/plan_route_customer.dart';
import 'package:telco_web_client/screens/route/plan_route_parcel.dart';
import 'package:telco_web_client/screens/route/plan_route_success.dart';
import 'package:telco_web_client/screens/track/track_screen.dart';

import 'screens/login/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telstar app',
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/route1') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteCustomer(),
          );
        }
        if (settings.name == '/route2') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteParcel(),
          );
        }
        if (settings.name == '/route3') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteAddresses(),
          );
        }
        if (settings.name == '/route4') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteChoices(),
          );
        }
        if (settings.name == '/route5') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteConfirmation(),
          );
        }
        if (settings.name == '/routesuccess') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteSuccess(),
          );
        }
        if (settings.name == '/track') {
          return MaterialPageRoute(
            builder: (context) => const TrackScreen(),
          );
        }
        if (settings.name == '/newcustomer') {
          return MaterialPageRoute(
            builder: (context) => const CreateCustomer(),
          );
        }
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
