import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/screens/landing_page_screen.dart';
import 'package:sg_finance/routes.dart';
import 'package:sg_finance/utils/color_utils.dart';
import '/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sg Finance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kcPrimaryColor,
      ),
      home: const LandingPageScreen(),
      routes: routes,
    );
  }
}
