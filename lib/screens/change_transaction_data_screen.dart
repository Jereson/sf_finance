import 'package:flutter/material.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';
import 'package:sg_finance/widget/random_widget.dart';

class ChangeTransactionDataScreen extends StatefulWidget {
  const ChangeTransactionDataScreen({super.key});

  @override
  State<ChangeTransactionDataScreen> createState() =>
      _ChangeTransactionDataScreenState();
}

class _ChangeTransactionDataScreenState
    extends State<ChangeTransactionDataScreen> {
  final formKey = GlobalKey<FormState>();
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
          builder: (cVm, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: cVm.txnAmountController,
                      validator: cVm.amountValidator,
                      decoration:
                          InputDecoration(hintText: 'Enter amount here'),
                    ),
                    const SizedBox(height: 20),
                    Text('Body'),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: cVm.txnTitleController,
                      decoration: InputDecoration(hintText: 'Enter body'),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => cVm.pickDate(context),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 47,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(8)),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text('Click to change time'),
                            const SizedBox(width: 50),
                            Text(cVm.date ?? '00-00-0000'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;
                          cVm.changeTransactionContoller(context);
                        },
                        child: Text('Modifier les transactions')),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
