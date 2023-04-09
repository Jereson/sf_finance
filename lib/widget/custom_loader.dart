import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sg_finance/utils/color_utils.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: kcPrimaryColor, borderRadius: BorderRadius.circular(10)),
            child: const SpinKitDualRing(
              color: Colors.white,
            )));
  }
}

void successMessage(BuildContext context, String title, String message,
    [bool isSuccess = true]) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    title: title,
    message: message,
    duration: const Duration(seconds: 3),
    backgroundColor: isSuccess ? Colors.green : kcBlack,
  ).show(context);
}
