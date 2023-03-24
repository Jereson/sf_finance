import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/string_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

class SoldeActuelTab extends StatelessWidget {
  const SoldeActuelTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        builder: (cVm, _) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Stack(clipBehavior: Clip.none, children: [
                Text(
                    '${cVm.compteAmount.replaceAllMapped(reg, addSpaceToString)},00 €',
                    style: st387E3C70030),
                const Positioned(
                    top: -10,
                    right: -23,
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.blue,
                      size: 20,
                    ))
              ]),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: cVm.compteData.length,
                      itemBuilder: (context, index) {
                        // 
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cVm.compteData[index].date!,
                              style: stBlackOpacity50010.copyWith(fontSize: 15),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 18),
                              margin: const EdgeInsets.only(bottom: 37),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cVm.compteData[index].color),
                                    child: Image.asset(
                                        cVm.compteData[index].imageUrl!),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(cVm.compteData[index].title!,
                                        style: st00002B40015),
                                  ),
                                  Text(
                                    '${cVm.compteData[index].amoount!.replaceAllMapped(reg, addSpaceToString)},00 €',
                                    style: st00002B60014.copyWith(
                                        color:
                                            cVm.compteData[index].amoount![0] == '-'
                                                ? kcBlack
                                                : kc387E3C),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }))
            ],
          );
        });
  }
}

class CompteDate {
  final String? title;
  final String? imageUrl;
  final String? date;
  final String? amoount;
  final Color? color;
  CompteDate(
      {required this.title,
      this.imageUrl,
      this.date,
      this.amoount,
      this.color});
}
