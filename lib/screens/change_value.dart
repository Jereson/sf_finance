import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ChangeVlaueScreen extends StatefulWidget {

  const ChangeVlaueScreen({super.key,});

  @override
  State<ChangeVlaueScreen> createState() => _ChangeVlaueScreenState();
}

class _ChangeVlaueScreenState extends State<ChangeVlaueScreen> {
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        elevation: 0.0,
        actions: [
          acctionIcon(Icons.power_settings_new, () {}),
        ],
      ),
      body: BaseViewBuilder<ChangeValueVm>(
          model: getIt(),
          initState: (init) {
            init.setCompteController();
          },
          builder: (cVm, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount'),
                    const SizedBox(height: 5),
                    Form(
                      key: formKey1,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cVm.soldeActuelAmountController,
                              // keyboardType: TextInputType.number,
                              validator: cVm.amountValidator,
                              decoration: InputDecoration(
                                  hintText: 'Enter amount here'),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                if (!formKey1.currentState!.validate()) return;
                             
                                cVm.changeAmountCollection(
                                    context, true);
                              },
                              child: Text(
                                'Change',
                                style: TextStyle(color: kcPrimaryColor),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text('Visa Amount'),
                    const SizedBox(height: 5),
                    Form(
                      key: formKey2,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: cVm.venirAmountController,
                              validator: cVm.amountValidator,
                              // keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: 'Enter value here'),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                if (!formKey2.currentState!.validate()) return;
                                cVm.changeAmountCollection(
                                    context,  false);
                              },
                              child: Text(
                                'Change',
                                style: TextStyle(color: kcPrimaryColor),
                              ))
                        ],
                      ),
                    ),
                  ]),
            );
          }),
    );
  }
}
