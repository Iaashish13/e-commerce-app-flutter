import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizmo/Helper/fab.dart';
import 'package:pizmo/Helper/headers.dart';
import 'package:pizmo/Helper/middle_helper.dart';
import 'package:pizmo/Screens/splash_screen.dart';
import 'package:pizmo/Services/authentication.dart';
import 'package:pizmo/Services/data.dart';
import 'package:pizmo/Services/get_location.dart';
import 'package:provider/provider.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      Provider<Headers>(
        create: (_) => Headers(),
      ),
      Provider<MiddleHelper>(
        create: (_) => MiddleHelper(),
      ),
      Provider<ManagingData>(
        create: (_) => ManagingData(),
      ),
      Provider<FAB>(
        create: (_) => FAB(),
      ),
      Provider<GetLocation>(create: (_)=>GetLocation(),),
      Provider<Authentication>(create: (_)=>Authentication(),),
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
