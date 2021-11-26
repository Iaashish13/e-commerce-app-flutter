import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/Admin%20Panel/Views/orders_scren.dart';
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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: Lottie.asset('assets/animations/pizza-slice.json'),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Pi',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'z',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: Colors.red,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: 'Moo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            color: Colors.black,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
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
                      Provider.of<Authentication>(context, listen: false)
                          .signUpAccount(_emailEditingController.text,
                              _passwordEditingController.text)
                          .whenComplete(() => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrdersScreen())));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: kActiveColor,
                      minimumSize: const Size(120, 36),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
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
