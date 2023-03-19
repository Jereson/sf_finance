import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/screens/change_value.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/random_widget.dart';

class AutresScreen extends StatelessWidget {
  const AutresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        automaticallyImplyLeading: false,
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
            height: 55,
            child: Column(
              children: [
                SizedBox(
                  width: 170,
                  child: Column(
                    children: [
                      Text(
                        'AUTRES',
                        style: stWhite70020,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 60,
                          height: 3,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text('Vie quotidienne', style: st00002B50016),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.black.withOpacity(0.5),
                )
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: autresData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 7) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ChangeVlaueScreen();
                        }));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.2,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            autresData[index].imageUrl!,
                            // height: 24,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            autresData[index].title!,
                            style: st00002B50012,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class AutresData {
  final String? title;
  final String? imageUrl;

  const AutresData({this.title, this.imageUrl});
}

List<AutresData> autresData =const [
  AutresData(title: 'Gestion de budget', imageUrl: svgChart),
  AutresData(title: 'RIB', imageUrl: svgAib),
  AutresData(title: 'Paylib Entre Amis', imageUrl: svgPaylib),
  AutresData(title: 'Mes prélèvements', imageUrl: svgMes),
  AutresData(title: 'Documents', imageUrl: svgDoc),
  AutresData(title: 'Mes demandes', imageUrl: svgScreen),
  AutresData(title: 'Rendez-vous', imageUrl: svgHands),
  AutresData(title: 'Mes parrainages', imageUrl: svgPercent),
];
