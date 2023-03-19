import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/screens/auth_screen.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Center(
            child: SvgPicture.asset(
              svgSg,
              // height: 30,
            ),
          ),
          SizedBox(height: size.height * 0.07),
          Container(
            // margin: const EdgeInsets.symmetric(horizontal: 20),

            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            height: size.height * 0.26,
            // height: 150,
            width: size.width * 0.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgCurve), fit: BoxFit.fill),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgVisible),
                Text('Afficher le solde', style: st58536E50020)
              ],
            ),
          ),
          const SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.circle,
                size: 10,
                color: kcPrimaryColor,
              ),
              SizedBox(width: 3),
              Icon(
                Icons.circle,
                size: 10,
                color: kc8A888B,
              ),
            ],
          ),
          const SizedBox(height: 38),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 74,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(children: [
              // SvgPicture.asset(svgBell),
              Image.asset(imgBell),
              const SizedBox(width: 17),
              Text(
                'Voir mes notifications',
                style: st00002B60016,
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_sharp,
                  color: Colors.black.withOpacity(0.4), size: 18)
            ]),
          ),
          const SizedBox(height: 28),
          Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: ListTile(
              leading: SvgPicture.asset(sgvTalk),
              title: Text('Posez-moi une question', style: st00002B60016),
              subtitle: Text(
                'Quel est mon RIB?',
                style: stA1A1A150016,
              ),
              trailing: Icon(Icons.arrow_forward_ios_sharp,
                  color: Colors.black.withOpacity(0.4), size: 18),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return const AuthScreen();
            })),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 226,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('Accéder à mes comptes',
                  style: stBlcak60017.copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 30),
          Text('Aide & Urgence', style: st73737360020),
          const Icon(Icons.keyboard_arrow_up_sharp)
        ]),
      ),
    );
  }
}
