import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/string_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

class SoldeActuelTab extends StatelessWidget {
  const SoldeActuelTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<ChangeValueVm>(
        model: getIt(),
        initState: (init) {
          init.getCompteBancaire();
        },
        builder: (cVm, _) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Stack(clipBehavior: Clip.none, children: [
                Text(
                    '${cVm.soldeActuelAmount!.replaceAllMapped(reg, addSpaceToString)},${cVm.soldeAcutelAmountModel!.soldeCent}€',
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
              cVm.compteBancaireModel.isEmpty
                  ? const Center(
                      child: SizedBox(
                          height: 150, child: CupertinoActivityIndicator()))
                  : Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(20),
                          itemCount: cVm.compteBancaireModel.length,
                          itemBuilder: (context, index) {
                     
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cVm.compteBancaireModel[index].date!,
                                  style: stBlackOpacity50010.copyWith(
                                      fontSize: 15),
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
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 44,
                                        width: 44,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(int.parse(cVm
                                                .compteBancaireModel[index]
                                                .colorCode!))),
                                        child: CachedNetworkImage(
                                          imageUrl: cVm
                                              .compteBancaireModel[index]
                                              .imageUrl!,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              const CupertinoActivityIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.broken_image),
                                        ),

                                        // Image.asset(
                                        //     cVm.compteBancaireModel[index].imageUrl!),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                            cVm.compteBancaireModel[index]
                                                .title!,
                                            style: st00002B60011),
                                      ),
                                      Text(
                                        '${cVm.compteBancaireModel[index].amount!.replaceAllMapped(reg, addSpaceToString)},00 €',
                                        style: st00002B60014.copyWith(
                                            color:
                                                cVm.compteBancaireModel[index]
                                                            .amount![0] ==
                                                        '-'
                                                    ? kc00002B
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


