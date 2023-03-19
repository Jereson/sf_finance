import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/random_widget.dart';

class VirementsScreen extends StatelessWidget {
  const VirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBgColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          acctionIcon(Icons.power_settings_new, () {}),
        ],
      ),
      body: ListView(
        // physics: const BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: kcPrimaryColor,
            width: double.infinity,
            height: 70,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        'VIREMENTS',
                        style: stWhite70020,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 65,
                          height: 3,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                itemCount: virementsData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(virementsData[index].imageUrl!),
                        SvgPicture.asset(
                          virementsData[index].imageUrl!,
                          height: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          virementsData[index].title!,
                          style: st00002B50012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Suivi et Bénéficiaires', style: st00002B50016),
          ),
          SizedBox(
            height: 180,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: suiviData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(suiviData[index].imageUrl!),
                        SvgPicture.asset(
                          suiviData[index].imageUrl!,
                          height: 30,
                          // colorFilter: ColorFilter.mode(kcPrimaryColor, BlendMode.srcIn)
                        ),
                        const SizedBox(height: 10),
                        Text(
                          suiviData[index].title!,
                          style: st00002B50012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class VirementsData {
  final String? title;
  final String? imageUrl;

  VirementsData({this.title, this.imageUrl});
}

List<VirementsData> virementsData = [
  VirementsData(title: 'Virements\n', imageUrl: svgVirement2),
  VirementsData(title: 'Virements\n PEL', imageUrl: svgPell),
  VirementsData(title: 'Virements International', imageUrl: svgVirementint2),
  VirementsData(title: 'Paylib\n Entre Amis', imageUrl: svgPaylib),
];

class SuiviData {
  final String? title;
  final String? imageUrl;

  SuiviData({this.title, this.imageUrl});
}

List<SuiviData> suiviData = [
  SuiviData(title: 'Suivi\n Virements', imageUrl: svgSuiviVirement),
  SuiviData(title: 'Gestion\n bénéficiaires', imageUrl: svgGestion),
];
