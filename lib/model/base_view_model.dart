import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ViewState { busy, done, error, none, noInternet }

class BaseViewModel with ChangeNotifier {
  ViewState viewState = ViewState.none;
  String viewMessage = '';
  String errorMessage = '';
  bool _disposed = false;

  bool get hasEncounteredError =>
      viewState == ViewState.error || viewState == ViewState.noInternet;
  bool get isBusy => viewState == ViewState.done;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  void setState({ViewState? viewState, String? viewMessage}) {
    if (viewState != null) this.viewState = viewState;
    if (viewMessage != null) this.viewMessage = viewMessage;
    if (!_disposed) notifyListeners();
  }

  final amountCollection = FirebaseFirestore.instance.collection('amount');
  final transactionCollection =
      FirebaseFirestore.instance.collection('compteBancaire');

  String? amountValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field required';
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Invalid amount';
    } else if (value.contains(RegExp(r'[a-z]'))) {
      return 'Invalid amount';
    } else if (value.contains(RegExp(r'[#?!@$%^&*;:<>$^~`./_\\]'))) {
      return 'Invalid amount';
    } else if (RegExp(',').allMatches(value).length > 1) {
      return 'Must contain 1 of comma (,)';
    } else if (value.split(',').last.length > 2) {
      return 'Invalid cent';
    } else {
      return null;
    }
  }
}
