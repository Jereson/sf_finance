import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sg_finance/screens/contact.dart';
import 'package:sg_finance/screens/home_screen.dart';
import 'package:sg_finance/screens/virements_screen.dart';
import 'package:sg_finance/screens/vos_cartes_screen.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  PersistentTabController? _controller;

  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: _buildTitle(),

      //     PersistentTabView(
      //   context,
      //   // padding: const NavBarPadding.all(2),
      //   navBarHeight: 68,
      //   controller: _controller,
      //   screens: _buildScreens(),
      //   items: _navBarsItems(),
      //   confineInSafeArea: true,
      //   backgroundColor: Colors.white, // Default is Colors.white.
      //   handleAndroidBackButtonPress: true, // Default is true.
      //   resizeToAvoidBottomInset:
      //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //   stateManagement: true, // Default is true.
      //   hideNavigationBarWhenKeyboardShows:
      //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      //   decoration: NavBarDecoration(
      //     borderRadius: BorderRadius.circular(10.0),
      //     colorBehindNavBar: Colors.white,
      //   ),
      //   popAllScreensOnTapOfSelectedTab: true,
      //   popActionScreens: PopActionScreensType.all,
      //   itemAnimationProperties: const ItemAnimationProperties(
      //     // Navigation Bar's items animation properties.
      //     duration: Duration(milliseconds: 200),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: const ScreenTransitionAnimation(
      //     // Screen transition animation on change of selected tab.
      //     animateTabTransition: true,
      //     curve: Curves.ease,
      //     duration: Duration(milliseconds: 200),
      //   ),
      //   navBarStyle:
      //       NavBarStyle.style6, // Choose the nav bar style with this property.
      // )
    );
  }

  List<Widget> _body = [
    const HomeScreen(),
    const VirementsScreen(),
    const VosCartesScreen(),
  
   ContactScreen(),
    Offstage()
  ];

  // List<Widget> _buildScreens() {
  //   return [
  //     const HomeScreen(),
  //     const VirementsScreen(),
  //     // const VosCartesScreen(),
  //     Center(
  //       child: Text('Cartes'),
  //     ),
  //     Center(
  //       child: Text('Contact'),
  //     ),
  //     Offstage()
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     navIcon('Accueil', 'home'),
  //     navIcon('Virements', 'virement'),
  //     navIcon('Cartes', 'cartes'),
  //     navIcon('Contact', 'contact'),
  //     navIcon('Autres', 'autres'),
  //   ];
  // }

  // PersistentBottomNavBarItem navIcon(String title, String svgPath) {
  //   return PersistentBottomNavBarItem(
  //       icon: Image.asset(
  //         'assets/nav/$svgPath.png',
  //         color: kcPrimaryColor,
  //         // height: 50,
  //       ),
  //       //     SvgPicture.asset(
  //       //   'assets/svg/$svgPath.svg',
  //       //   colorFilter: ColorFilter.mode(kcPrimaryColor, BlendMode.srcIn),
  //       //   // height: 50,
  //       // ),

  //       //  Icon(
  //       //   icon,
  //       //   color: kcPrimaryColor,
  //       // ),
  // inactiveIcon: Image.asset(
  //   'assets/nav/$svgPath.png',
  //   color: Colors.black,
  //   // height: 50,
  // ),

  //       //     SvgPicture.asset(
  //       //   'assets/svg/$svgPath.svg',
  //       //   colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
  //       //   // height: 50
  //       // ),

  //       //  Icon(
  //       //   icon,
  //       //   color: Colors.black,
  //       // ),
  //       inactiveColorSecondary: Colors.black,
  //       activeColorSecondary: kcPrimaryColor,
  //       textStyle: navTextStyle,
  //       title: title);
  // }

  Widget _buildTitle() {
    return SizedBox(
      height: 80,
      child: CustomNavigationBar(
        // iconSize: 30.0,
        // selectedColor: kcPrimaryColor,
        strokeColor: Colors.transparent,
        // unSelectedColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          _buildTitileItem('Accueil', 'home',
              _currentIndex == 0 ? kcPrimaryColor : Colors.black),
          _buildTitileItem('Virements', 'virement',
              _currentIndex == 1 ? kcPrimaryColor : Colors.black),
          _buildTitileItem('Cartes', 'cartes',
              _currentIndex == 2 ? kcPrimaryColor : Colors.black),
          _buildTitileItem('Contact', 'contact',
              _currentIndex == 3 ? kcPrimaryColor : Colors.black),
          _buildTitileItem('Autres', 'autres',
              _currentIndex == 4 ? kcPrimaryColor : Colors.black),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

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
