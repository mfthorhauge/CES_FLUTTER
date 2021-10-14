import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'User Id'),
          ),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password'),
          ),
          TextButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/route1',
              );
            },
          ),
        ]),
      ),
    );
  }
}
