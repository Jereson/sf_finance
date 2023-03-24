import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/screens/change_solde_data_screen.dart';
import 'package:sg_finance/screens/landing_page_screen.dart';
import 'package:sg_finance/routes.dart';

void main() {
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
      theme: ThemeData(),
      // home: const ChangeSoldeDataScreen(),
      home: const LandingPageScreen(),

      routes: routes,
    );
  }
}
