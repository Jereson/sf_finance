import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/screens/change_transaction_data_screen.dart';
import 'package:sg_finance/screens/change_value.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/string_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ChangeSoldeBancaireScreen extends StatelessWidget {
  const ChangeSoldeBancaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kcPrimaryColor,
          elevation: 0.0,
          title: Text('Changer le solde bancaire'),
          actions: [
            acctionIcon(Icons.power_settings_new, () {}),
          ],
        ),
        body: BaseViewBuilder<ChangeValueVm>(
            model: getIt(),
            initState: (init) {
              init.getCompteBancaire();
            },
            builder: (cVm, _) {
              return cVm.compteBancaireModel.isEmpty
                  ? const Center(
                      child: SizedBox(
                          height: 150, child: CupertinoActivityIndicator()))
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: cVm.compteBancaireModel.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cVm.setTransactionController(
                                cVm.compteBancaireModel[index]);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ChangeTransactionDataScreen();
                            }));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cVm.compteBancaireModel[index].date!,
                                style:
                                    stBlackOpacity50010.copyWith(fontSize: 15),
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
                                          color: Color(int.parse(cVm
                                              .compteBancaireModel[index]
                                              .colorCode!))),
                                      child: CachedNetworkImage(
                                        imageUrl: cVm.compteBancaireModel[index]
                                            .imageUrl!,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.broken_image),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                          cVm.compteBancaireModel[index].title!,
                                          style: st00002B60011),
                                    ),
                                    Text(
                                      '${cVm.compteBancaireModel[index].amount!.replaceAllMapped(reg, addSpaceToString)},${cVm.compteBancaireModel[index].cent} €',
                                      style: st00002B60014.copyWith(
                                          color: cVm.compteBancaireModel[index]
                                                      .amount![0] ==
                                                  '-'
                                              ? kc00002B
                                              : kc387E3C),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
            }));
  }
}
