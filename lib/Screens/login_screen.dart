import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(
                      24,
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                controller: _passwordEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(
                      24,
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextButton(
                onPressed: () {},
               style:  TextButton.styleFrom(
                 primary: Colors.white,
                 backgroundColor: Colors.lightBlueAccent,
               ),
                child: const Text('Login'),
              )
            ],   
          ),
        ),
      ),
    );
  }
}
