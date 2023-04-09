import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:sg_finance/model/base_view_model.dart';
import 'package:sg_finance/model/compte_bancaire.dart';
import 'package:sg_finance/model/solde_acutel_amount_model.dart';
import 'package:intl/intl.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/widget/custom_loader.dart';

class ChangeValueVm extends BaseViewModel {
  SoldeAcutelAmountModel? soldeAcutelAmountModel;
  List<CompteBancaireModel> compteBancaireModel = [];
  String? soldeActuelAmount;
  String? cbAmount;
  final soldeActuelAmountController = TextEditingController();
  final venirAmountController = TextEditingController();
  String? soldeAcutelId;

  final txnAmountController = TextEditingController();
  final txnTitleController = TextEditingController();
  String? txtId;

  DateTime? selectedDate;
  final newDateFormat = DateFormat("dd/MM/yyyy");
  String? date;

  int currentVanIndex = 0;

  void changeNavIndex(int index) {
    currentVanIndex = index;
    setState();
  }

  void setCompteController() {
    soldeActuelAmountController.text =
        '${soldeAcutelAmountModel!.soldeActuelAmount},${soldeAcutelAmountModel!.soldeCent}';
    venirAmountController.text =
        '${soldeAcutelAmountModel!.venirAmount},${soldeAcutelAmountModel!.venirCent}';
    soldeAcutelId = soldeAcutelAmountModel!.id!;
  }

  void setTransactionController(CompteBancaireModel compteBancaireModel) {
    txnAmountController.text =
        '${compteBancaireModel.amount!},${compteBancaireModel.cent}';
    txnTitleController.text = compteBancaireModel.title!;
    date = compteBancaireModel.date!;
    txtId = compteBancaireModel.id!;
    setState();
  }

  Future<void> getAmount() async {
    await amountCollection.get().then((value) {
      if (value.docs.isNotEmpty) {
        soldeAcutelAmountModel =
            SoldeAcutelAmountModel.fromJson(value.docs[0].data());
        soldeActuelAmount = soldeAcutelAmountModel!.soldeActuelAmount!;
        cbAmount = soldeAcutelAmountModel!.venirAmount!;

        setState();
      }
    });
  }

  Future<void> getCompteBancaire() async {
    await transactionCollection.get().then((value) {
      if (value.docs.isNotEmpty) {
        compteBancaireModel = [];
        for (var doc in value.docs) {
          compteBancaireModel.add(CompteBancaireModel.fromJson(doc.data()));
        }
        setState();
      }
    });
  }

  Future<void> changeAmountCollection(
      BuildContext context, bool isSolde) async {
    String? soldeAmount;
    String? soldeCent;

    String? venirAmount;
    String? venirCent;

    if (soldeActuelAmountController.text.contains(',')) {
      final spliteText = soldeActuelAmountController.text.split(',');
      soldeAmount = spliteText.first;
      soldeCent = spliteText.last;
    } else {
      soldeAmount = soldeActuelAmountController.text;
      soldeCent = '00';
    }

    if (venirAmountController.text.contains(',')) {
      final splitText = venirAmountController.text.split(',');
      venirAmount = splitText.first;
      venirCent = splitText.last;
    } else {
      venirAmount = venirAmountController.text;
      venirCent = '00';
    }
    Map<Object, Object?> soldData = {
      'soldeActuelAmount': soldeAmount,
      'soldeCent': soldeCent
    };
    Map<Object, Object?> veirData = {
      'venirAmount': venirAmount,
      'venirCent': venirCent
    };

    try {
      print('The$soldeAcutelId');
      print(soldData);

      await amountCollection
          .doc(soldeAcutelId!.trim())
          .update(isSolde ? soldData : veirData)
          .showCustomProgressDialog(context)
          .then((value) async {
        await getAmount();

        if (context.mounted) {
          successMessage(context, 'Success', 'Item updated successfully');
        }
      }).catchError((error) {
        print(error);

        successMessage(context, 'Error', 'Failed to update try again', false);
      });
    } catch (e) {
      successMessage(context, 'Error', e.toString());
    }
  }

  Future<void> pickDate(BuildContext context) async {
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

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date = newDateFormat.format(selectedDate!);

      print('selectedDate $selectedDate');
      print('date $date');
      setState();
    }
  }

  Future<void> changeTransactionContoller(BuildContext context) async {
    try {
      if (date != null) {
        String? txnAmount;
        String? cent;
        if (txnAmountController.text.contains(',')) {
          final splitText = txnAmountController.text.split(',');
          txnAmount = splitText.first;
          cent = splitText.last;
        } else {
          txnAmount = txnAmountController.text;
          cent = '00';
        }
        await transactionCollection
            .doc(txtId!.trim())
            .update({
              'amount': txnAmount,
              'date': date,
              'title': txnTitleController.text,
              'cent':cent
            })
            .showCustomProgressDialog(context)
            .then((value) async {
              await getCompteBancaire();
              if (context.mounted) {
                successMessage(context, 'Success', 'Item updated successfully');
              }
            })
            .catchError((error) {
              successMessage(
                  context, 'Error', 'Failed to update try again', false);
            });
      } else {
        successMessage(context, 'Date', 'Date is required', false);
      }
    } catch (e) {
      successMessage(context, 'Error', 'Error occured try again', false);
    }
  }
}
