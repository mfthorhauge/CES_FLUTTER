import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
              width: 100.0,
              child:  TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'User Id'),
              ),
          ),
          const SizedBox(
            width: 100.0,
            child:  TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/route1',
              );
            },
            child: const Text('Login'),
          ),
          TextButton(
            child: const Text('Create Account'),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
