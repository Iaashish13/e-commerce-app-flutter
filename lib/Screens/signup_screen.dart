import 'package:flutter/material.dart';
import 'package:pizmo/Screens/home_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: appBar(context),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                obscureText: true,
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
                onPressed: () {
                  Provider.of<Authentication>(context,listen: false)
                      .signUpAccount(_emailEditingController.text,
                          _passwordEditingController.text)
                      .whenComplete(() => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())));
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ],
    );
  }
}
