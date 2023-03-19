import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/screens/comptes_screen.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/home_card_widget.dart';
import 'package:sg_finance/widget/random_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kcPrimaryColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        actions: [
          acctionIcon(Icons.add_circle_outline, () {}),
          acctionIcon(Icons.notifications_outlined, () {}),
          const SizedBox(width: 20),
          acctionIcon(Icons.power_settings_new, () {}),
        ],
      ),
      body: ListView(
          // physics: const BouncingScrollPhysics(),
          children: [
            Container(height: 30, color: kcPrimaryColor),
            Container(
              height: 40,
              color: kcPrimaryColor,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() => _currentIndex = index);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? kcB30108
                                : kcPrimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          listItem[index],
                          style: stFFFFFF60014,
                        ),
                      ),
                    );
                  }),
            ),
            Container(height: 10, color: kcPrimaryColor),
            Container(
              color: screenBgColor,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text('Mes comptes courants', style: st00002B60018),
                          Positioned(
                            bottom: -2.5,
                            right: -20,
                            child: Container(
                              alignment: Alignment.centerRight,
                              // margin: const EdgeInsets.only(right: 100),
                              width: MediaQuery.of(context).size.width * 0.14,
                              height: 3,
                              color: kcPrimaryColor,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Transform.translate(
                              offset: const Offset(20, 0),
                              child: SvgPicture.asset(svgMoreVert)))
                    ],
                  ),
                  const SizedBox(height: 10),
                  HomeCardWidget(
                    callback1: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CompteScreen(currentIndex: 0);
                    })),
                    callback2: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CompteScreen(currentIndex: 1);
                    })),
                  ),
                  //TODO:: Uncomment oute
                  // const SizedBox(height: 30),
                  // Text('Par procuration', style: st00002B60014),
                  // const SizedBox(height: 10),
                  // const HomeCardWidget(),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 226,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 3)),
                      child: Text('Voir tous mes comptes', style: stBlcak60017),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

List<String> listItem = ['Comptes', 'Emprunter', 'Épargner', 'Assurer'];
