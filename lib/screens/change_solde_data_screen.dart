import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sg_finance/getit.dart';
import 'package:sg_finance/model/base_view_builder.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';
import 'package:sg_finance/widget/random_widget.dart';
import 'package:sg_finance/widget/solde_actuel_tab.dart';

class ChangeSoldeDataScreen extends StatelessWidget {
  const ChangeSoldeDataScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount'),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: cVm.firstItemAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter amount here'),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => cVm.pickFirstDateOfBirth(context),
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
                          Text('Click to chnage time'),
                          const SizedBox(width: 50),
                          Text(cVm.firstDate ?? '00-00-0000'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        cVm.changeFirstListItem(context);
                      },
                      child: Text('Change First Item')),
                  Divider(
                    thickness: 10,
                    color: kcPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text('Amount'),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: cVm.secondItemAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter amount here'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => cVm.pickSecondDateOfBirth(context),
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
                          Text('Click to chnage time'),
                          const SizedBox(width: 50),
                          Text(cVm.secondDate ?? '00-00-0000'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () => cVm.changeSecondListItem(context),
                      child: Text('Change second item')),
                  Divider(
                    thickness: 10,
                    color: kcPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text('Amount'),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: cVm.thirdItemAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter amount here'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => cVm.pickThirdDateOfBirth(context),
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
                          Text(cVm.thirdDate ?? '00-00-0000'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () => cVm.changeThirdListItem(context),
                      child: Text('Change third item')),
                  Divider(
                    thickness: 10,
                    color: kcPrimaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text('Amount'),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: cVm.firstItemAmountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter amount here'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => cVm.pickForthDateOfBirth(context),
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
                          Text(cVm.fourthDate ?? '00-00-0000'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () => cVm.changeForuthListItem(context),
                      child: Text('Change forth item')),
                ],
              ),
            );
          }),
    );
  }
}
