import 'package:flutter/material.dart';
import 'package:telco_web_client/screens/route/plan_route_customer.dart';
import 'package:telco_web_client/screens/route/plan_route_parcel.dart';
import 'package:telco_web_client/screens/track/track_screen.dart';

import 'screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
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
        if (settings.name == '/track') {
          return MaterialPageRoute(
            builder: (context) => const TrackScreen(),
          );
        }
        return MaterialPageRoute(
            builder: (context) => const LoginScreen());
      },
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.red,
      ),
    );
  }
}
