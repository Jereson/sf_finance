import 'package:flutter/material.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/widget/a_venir_tab.dart';
import 'package:sg_finance/widget/random_widget.dart';
import 'package:sg_finance/widget/solde_actuel_tab.dart';

class CompteScreen extends StatefulWidget {
  final int? currentIndex;
  const CompteScreen({super.key, required this.currentIndex});

  @override
  State<CompteScreen> createState() => _CompteScreenState();
}

class _CompteScreenState extends State<CompteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBgColor,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        centerTitle: true,
        title: Text(
          'Compte Bancaire',
          style: stWhite70020,
        ),
        actions: [
          acctionIcon(Icons.search_outlined, () {}),
          acctionIcon(Icons.more_vert, () {}),
        ],
      ),
      body: DefaultTabController(
          initialIndex: widget.currentIndex!,
          length: 2,
          animationDuration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TabBar(
                  labelColor: kcBlack,
                  labelStyle: st00002B40018,
                  indicatorColor: kc00002B,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Solde Actuel'),
                    Tab(text: 'À venir')
                  ]),
              const Expanded(
                  child: TabBarView(children: [SoldeActuelTab(), AVenirTab()]))
            ],
          )),
    );
  }
}
