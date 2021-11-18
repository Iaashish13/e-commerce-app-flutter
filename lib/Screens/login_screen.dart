import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pizmo/Helper/constants.dart';
import 'package:pizmo/Screens/home_screen.dart';
import 'package:pizmo/Screens/signup_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        leading: appBar(context),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 24,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailEditingController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  24,
                                ),
                              ),
                            ),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<Authentication>(context, listen: false)
                              .loginIntoAccount(_emailEditingController.text,
                                  _passwordEditingController.text)
                              .whenComplete(() => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen())));
                        },
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: kActiveColor,
                            minimumSize: const Size(120, 36)),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: kActiveColor,
                            minimumSize: const Size(120, 36)),
                        child: const Text(
                          'Signup',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
          ),
        ),
      ],
    );
  }
}
