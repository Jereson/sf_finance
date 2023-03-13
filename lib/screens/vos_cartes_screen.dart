import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/random_widget.dart';

class VosCartesScreen extends StatelessWidget {
  const VosCartesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBgColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        actions: [
          acctionIcon(Icons.power_settings_new, () {}),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: kcPrimaryColor,
            width: double.infinity,
            height: 70,
            child: Column(
              children: [
                Text(
                  'VOS CARTES',
                  style: stWhite70020.copyWith(fontSize: 26),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 70),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 3,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const VosCatesWidget(),
          const VosCatesWidget(),
          const SizedBox(height: 40),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 226,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Voir tous mes comptes',
                  style: stBlcak60017.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class VosCatesWidget extends StatelessWidget {
  const VosCatesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                imgCard1,
                height: 30,
              ),
              const SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CB Visa', style: st00002B60014),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text('N°    ****4809', style: st1E1E1E50014),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: kcD9D9D9.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(3)),
                            child: Text('Débit différé',
                                style: stBlackOpacity50010),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
