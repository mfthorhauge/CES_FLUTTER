import 'package:flutter/material.dart';
import 'package:telco_web_client/screens/plan_route_customer.dart';

import 'screens/login_screen.dart';

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
      title: 'Telco app',
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/route1') {
          return MaterialPageRoute(
            builder: (context) => const PlanRouteCustomer(),
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
