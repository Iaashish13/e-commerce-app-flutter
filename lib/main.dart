import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/fab.dart';
import 'package:pizmo/Helper/headers.dart';
import 'package:pizmo/Helper/middle_helper.dart';
import 'package:pizmo/Providers/calculations.dart';
import 'package:pizmo/Screens/splash_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:pizmo/Services/data.dart';
import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => Headers(),
      ),
      ChangeNotifierProvider(
        create: (_) => MiddleHelper(),
      ),
      ChangeNotifierProvider(
        create: (_) => ManagingData(),
      ),
      ChangeNotifierProvider(
        create: (_) => FAB(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetLocation(),
      ),
      ChangeNotifierProvider(
        create: (_) => Authentication(),
      ),
      ChangeNotifierProvider(
        create: (_) => Calculations(),
      ),
   
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizmo',
      theme: ThemeData(
        primarySwatch: Colors.blue,  
        fontFamily: 'Yaldevi',
      ),
      home: const SplashScreen(),
    );
  }
}
