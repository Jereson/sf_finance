import 'package:flutter/material.dart';

acctionIcon(IconData icon, VoidCallback callback) {
  return IconButton(
      onPressed: callback,
      icon: Icon(
        icon,
        size: 30,
      ));
}
