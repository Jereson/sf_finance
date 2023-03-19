import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/string_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

class AVenirTab extends StatelessWidget {
  const AVenirTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        builder: (cVm, _) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                          '${cVm.cbAmount.replaceAllMapped(reg, addCommaToString)} €',
                          style: st387E3C70030),
                      const Positioned(
                          top: -10,
                          right: -23,
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: Colors.blue,
                            size: 20,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text('Encours cartes', style: st00002B50020),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                              Text('CB Visa Infinite', style: st00002B60014),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text('N°    ****4809',
                                          style: st1E1E1E50014),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: kcD9D9D9.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(3)),
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
                      const Spacer(),
                      Text('75,10 €',
                          style: st00002B60014.copyWith(color: kc387E3C))
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Prélèvements et virements à venir',
                  style: st00002B50020,
                ),
                Text("Vous n'avez pas d'opération à venir identifiée",
                    style: stBlack40016)
              ],
            ),
          );
        });
  }
}
