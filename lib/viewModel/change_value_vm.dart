import 'package:flutter/material.dart';
import 'package:sg_finance/model/base_view_model.dart';

class ChangeValueVm extends BaseViewModel {
  String compteAmount = '0';
  String cbAmount = '0';
  final compteController = TextEditingController();
  final cbController = TextEditingController();

  int currentVanIndex = 0;

  void setCompteAmount() {
    compteController.text = compteAmount;
  }

  void setcbAmount() {
    cbController.text = cbAmount;
  }

  void changeCompteAmount() {
    compteAmount = compteController.text;
    setState();
  }

  changeCbAcount() {
    cbAmount = cbController.text;
    setState();
  }

  void changeNavIndex(int index) {
    currentVanIndex = index;
    // print(currentVanIndex);
    setState();
  }
}
