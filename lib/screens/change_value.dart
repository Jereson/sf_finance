import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ChangeVlaueScreen extends StatelessWidget {
  const ChangeVlaueScreen({super.key});

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
            init.setcbAmount();
            init.setCompteAmount();
          },
          builder: (cVm, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount'),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cVm.compteController,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(hintText: 'Enter amount here'),
                          ),
                        ),
                        TextButton(
                            onPressed: () => cVm.changeCompteAmount(),
                            child: Text(
                              'Change',
                              style: TextStyle(color: kcPrimaryColor),
                            ))
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text('Visa AMount'),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cVm.cbController,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(hintText: 'Enter value here'),
                          ),
                        ),
                        TextButton(
                            onPressed: () => cVm.changeCbAcount(),
                            child: Text(
                              'Change',
                              style: TextStyle(color: kcPrimaryColor),
                            ))
                      ],
                    ),
                  ]),
            );
          }),
    );
  }
}
