import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/screens/autres_screen.dart';
import 'package:sg_finance/screens/contact.dart';
import 'package:sg_finance/screens/home_screen.dart';
import 'package:sg_finance/screens/virements_screen.dart';
import 'package:sg_finance/screens/vos_cartes_screen.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        builder: (cVm, _) {
          return Scaffold(
            body: screenItems[cVm.currentVanIndex],
            bottomNavigationBar: CustomButtonNav(),
          );
        });
  }

  List<Widget> screenItems = [
    const HomeScreen(),
    const VirementsScreen(),
    const VosCartesScreen(),
    const ContactScreen(),
    const AutresScreen()
  ];

  // Widget _buildTitle() {
  //   return SizedBox(
  //     height: 80,
  //     child: CustomNavigationBar(
  //       // iconSize: 30.0,
  //       // selectedColor: kcPrimaryColor,
  //       strokeColor: Colors.transparent,
  //       // unSelectedColor: Colors.black,
  //       backgroundColor: Colors.white,
  //       items: [
  //         _buildTitileItem('Accueil', 'home',
  //             _currentIndex == 0 ? kcPrimaryColor : Colors.black),
  //         _buildTitileItem('Virements', 'virement',
  //             _currentIndex == 1 ? kcPrimaryColor : Colors.black),
  //         _buildTitileItem('Cartes', 'cartes',
  //             _currentIndex == 2 ? kcPrimaryColor : Colors.black),
  //         _buildTitileItem('Contact', 'contact',
  //             _currentIndex == 3 ? kcPrimaryColor : Colors.black),
  //         _buildTitileItem('Autres', 'autres',
  //             _currentIndex == 4 ? kcPrimaryColor : Colors.black),
  //       ],
  //       currentIndex: _currentIndex,
  //       onTap: (index) {
  //         setState(() {
  //           _currentIndex = index;
  //         });
  //       },
  //     ),
  //   );
  // }

  _buildTitileItem(String title, String imageUrl, Color color) {
    return CustomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Image.asset(
          'assets/nav/$imageUrl.png',
          color: color,
          // height: 50,
        ),

        // SvgPicture.asset(
        //   'assets/svg/$imageUrl.svg',
        //   colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        //   // height: 50,
        // ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          title,
          style: navTextStyle.copyWith(color: color),
        ),
      ),
    );
  }
}

class CustomButtonNav extends StatelessWidget {
  const CustomButtonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        builder: (cVm, _) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 3, color: Colors.grey.withOpacity(0.1)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavButton(
                  title: 'Home',
                  iconUrl: 'home',
                  isIndex: cVm.currentVanIndex == 0 ? true : false,
                  callback: () {
                    print('object');
                    cVm.changeNavIndex(0);
                  },
                ),
                NavButton(
                  title: 'Virements',
                  iconUrl: 'virement',
                  isIndex: cVm.currentVanIndex == 1 ? true : false,
                  callback: () {
                    cVm.changeNavIndex(1);
                  },
                ),
                NavButton(
                  title: 'Cartes',
                  iconUrl: 'cartes',
                  isIndex: cVm.currentVanIndex == 2 ? true : false,
                  callback: () {
                    cVm.changeNavIndex(2);
                  },
                ),
                NavButton(
                  title: 'Contact',
                  iconUrl: 'contact',
                  isIndex: cVm.currentVanIndex == 3 ? true : false,
                  callback: () {
                    cVm.changeNavIndex(3);
                  },
                ),
                NavButton(
                  title: 'Autres',
                  iconUrl: 'autres',
                  isIndex: cVm.currentVanIndex == 4 ? true : false,
                  callback: () {
                    cVm.changeNavIndex(4);
                  },
                ),
              ],
            ),
          );
        });
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final String iconUrl;
  final bool isIndex;
  final VoidCallback callback;
  const NavButton(
      {super.key,
      required this.title,
      required this.iconUrl,
      this.isIndex = false,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: Material(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/nav/$iconUrl.png',
              //   color: isIndex ? kcPrimaryColor : Colors.black,
              //   height: 20,
              // ),
              isIndex
                  ? SvgPicture.asset('assets/svg/$iconUrl.svg',
                      colorFilter: const ColorFilter.mode(
                          kcPrimaryColor, BlendMode.srcIn),
                      height: 20)
                  : SvgPicture.asset('assets/svg/$iconUrl.svg',
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      height: 20),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    // height: .1,
                    color: isIndex ? kcPrimaryColor : Colors.black),
              )
            ],
          ),
        ));
  }
}
