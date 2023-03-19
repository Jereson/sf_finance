import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                  width: 180,
                  child: Column(
                    children: [
                      Text(
                        'CONTACT',
                        style: stWhite70020
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 70,
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
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.2,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
            height: 74,
            child: Row(
              children: [
                const SizedBox(width: 10),
                SvgPicture.asset(svgQuestion),
                const SizedBox(width: 14),
                Text('Posez-moi une question', style: st00002B50012)
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: contactData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 6 / 4.2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemBuilder: (context, index) {
                  return Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          contactData[index].imageUrl!,
                          // height: 24,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          contactData[index].title!,
                          style: st00002B50012,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ConatactData {
  final String? title;
  final String? imageUrl;
  const ConatactData({this.title, this.imageUrl});
}

List<ConatactData> contactData = const [
  ConatactData(title: 'Messagerie', imageUrl: svgMessage),
  ConatactData(title: 'Prendre Rdv', imageUrl: svgHands),
  ConatactData(
      title: 'Trouver une agence ou un distributeur', imageUrl: svgLocation),
  ConatactData(title: 'Mes autres contacts', imageUrl: svgPereson),
  ConatactData(title: 'Donner votre avis', imageUrl: svgStar),
];
