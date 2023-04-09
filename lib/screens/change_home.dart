import 'package:flutter/material.dart';
import 'package:sg_finance/screens/change_solde_bancaire_screen.dart';
import 'package:sg_finance/screens/change_transaction_data_screen.dart';
import 'package:sg_finance/screens/change_value.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ChangeHomeScreen extends StatelessWidget {
  const ChangeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        actions: [
          acctionIcon(Icons.power_settings_new, () {}),
        ],
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeVlaueScreen();
                  }));
                },
                child: Text('Changer le solde bancaire'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeSoldeBancaireScreen();
                  }));
                },
                child: Text('Modifier les transactions'),
              ),
            ]),
      ),
    );
  }
}
