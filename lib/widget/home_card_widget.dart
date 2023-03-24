import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/string_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

class HomeCardWidget extends StatelessWidget {
  final VoidCallback? callback1;
  final VoidCallback? callback2;

  const HomeCardWidget({super.key, this.callback1, this.callback2});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        builder: (cVm, _) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              GestureDetector(
                onTap: callback1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 20, right: 12, left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Compte Bancaire', style: st00002B60014),
                          const Spacer(),
                          Text(
                              '${cVm.compteAmount.replaceAllMapped(reg, addSpaceToString)},00 €',
                              style: st00002B60014.copyWith(color: kc387E3C))
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'N°    ****4809',
                        style: st1E1E1E50014,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: callback2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 20, right: 12, left: 12),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            imgCard1,
                            height: 30,
                          ),
                          // SvgPicture.asset(svgVisa),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CB Visa Infinite', style: st00002B60014),
                              const SizedBox(height: 5),
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
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                          '${cVm.cbAmount.replaceAllMapped(reg, addSpaceToString)},00 €',
                          style: st00002B60014.copyWith(color: kc387E3C))
                    ],
                  ),
                ),
              )
            ]),
          );
        });
  }
}
