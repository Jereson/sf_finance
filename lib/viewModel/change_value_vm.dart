import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sg_finance/model/base_view_model.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:intl/intl.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/widget/solde_actuel_tab.dart';

class ChangeValueVm extends BaseViewModel {
  String compteAmount = '0';
  String cbAmount = '0';
  final compteController = TextEditingController();
  final cbController = TextEditingController();
  final firstItemAmountController = TextEditingController();
  final secondItemAmountController = TextEditingController();
  final thirdItemAmountController = TextEditingController();
  final fourthItemAmountController = TextEditingController();

  DateTime? selectedFirstDate;
  final newFirstDateFormat = DateFormat("dd/MM/yyyy");
  String? firstDate;

  DateTime? selectedSecondDate;
  final newSecondDateFormat = DateFormat("dd/MM/yyyy");
  String? secondDate;

  DateTime? selectedThirdDate;
  final newThirdDateFormat = DateFormat("dd/MM/yyyy");
  String? thirdDate;

  DateTime? selectedFourthDate;
  final newFourthDateFormat = DateFormat("dd/MM/yyyy");
  String? fourthDate;

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

  Future<void> pickFirstDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kcPrimaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              )),
              child: child!);
        },
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedFirstDate) {
      selectedFirstDate = picked;
      firstDate = newFirstDateFormat.format(selectedFirstDate!);

      print('selectedDate $selectedFirstDate');
      print('date $firstDate');
      setState();
    }
  }

  Future<void> pickSecondDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kcPrimaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              )),
              child: child!);
        },
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedSecondDate) {
      selectedSecondDate = picked;
      secondDate = newSecondDateFormat.format(selectedSecondDate!);

      print('selectedDate $selectedSecondDate');
      print('date $secondDate');
      setState();
    }
  }

  Future<void> pickThirdDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kcPrimaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              )),
              child: child!);
        },
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedThirdDate) {
      selectedThirdDate = picked;
      thirdDate = newThirdDateFormat.format(selectedThirdDate!);

      print('selectedDate $selectedThirdDate');
      print('date $thirdDate');
      setState();
    }
  }

  Future<void> pickForthDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                primary: kcPrimaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              )),
              child: child!);
        },
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedFourthDate) {
      selectedFourthDate = picked;
      fourthDate = newFourthDateFormat.format(selectedFourthDate!);

      print('selectedDate $selectedFourthDate');
      print('date $fourthDate');
      setState();
    }
  }

  void changeFirstListItem(BuildContext context) {
    print('The date $firstDate and the text ${firstItemAmountController.text}');
    if (firstDate != null && firstItemAmountController.text.isNotEmpty) {
      final replacement = [
        CompteDate(
            title:
                'VIR INST RE 354077769381 DE: Francois BABEL DATE: 09/02/2023 05:37',
            imageUrl: imgEuro,
            amoount: firstItemAmountController.text,
            date: firstDate,
            color: Colors.blue)
      ];
      compteData.replaceRange(0, 0, replacement);

      setState();
      successMessage(context);
    } else {
      faildMessage(context);
    }
  }

  void changeSecondListItem(BuildContext context) {
    if (secondDate != null && firstItemAmountController.text.isNotEmpty) {
      final replacement = [
        CompteDate(
            title:
                'FRAIS SUR SATD DE 5 049,01      EUROS SIP SAINT-OUEN-SUR-SEINE',
            imageUrl: imgEuro,
            amoount: secondItemAmountController.text,
            date: secondDate,
            color: Colors.blue)
      ];
      compteData.replaceRange(1, 1, replacement);

      setState();
      successMessage(context);
    } else {
      faildMessage(context);
    }
  }

  void changeThirdListItem(BuildContext context) {
    if (thirdDate != null && thirdItemAmountController.text.isNotEmpty) {
      final replacement = [
        CompteDate(
            title:
                'FRAIS VIR INSTANTANE ELEC 351971564343 REF032023019597982590000001',
            imageUrl: imgEuro,
            amoount: thirdItemAmountController.text,
            date: thirdDate,
            color: Colors.blue)
      ];
      compteData.replaceRange(1, 1, replacement);

      setState();
      successMessage(context);
    } else {
      faildMessage(context);
    }
  }

  void changeForuthListItem(BuildContext context) {
    if (fourthDate != null && fourthItemAmountController.text.isNotEmpty) {
      final replacement = [
        CompteDate(
            title:
                'VIR INST RE 354077769381 DE: Francois BABEL DATE: 09/02/2023 05:37',
            imageUrl: imgEuro,
            amoount: fourthItemAmountController.text,
            date: fourthDate,
            color: Colors.blue)
      ];
      compteData.replaceRange(1, 1, replacement);

      setState();
      successMessage(context);
    } else {
      faildMessage(context);
    }
  }

  setValueToNull() {
    firstDate = null;
    firstItemAmountController.clear();
  }

  List<CompteDate> compteData = [
    CompteDate(
        title:
            'VIR INST RE 354077769381 DE: Francois BABEL DATE: 09/02/2023 05:37',
        imageUrl: imgEuro,
        amoount: '100',
        date: '09/02/2023',
        color: Colors.blue),
    CompteDate(
        title: 'FRAIS SUR SATD DE 5 049,01      EUROS SIP SAINT-OUEN-SUR-SEINE',
        imageUrl: imgHand,
        amoount: '-100',
        date: '09/02/2023',
        color: Colors.amberAccent),
    CompteDate(
        title:
            'FRAIS VIR INSTANTANE ELEC 351971564343 REF032023019597982590000001',
        imageUrl: imgEuro,
        amoount: '-043',
        date: '09/02/2023',
        color: Colors.pink),
    CompteDate(
        title:
            'VIR INST RE 354077769381 DE: Francois BABEL DATE: 09/02/2023 05:37',
        imageUrl: imgEuro,
        amoount: '1200',
        date: '09/02/2023',
        color: Colors.red)
  ];

  void successMessage(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: "Updated",
      message: "Item updated successully",
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  void faildMessage(BuildContext context) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: "All fields are required",
      message: "Fill the requre fileds to make update",
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
