
import 'package:flutter/cupertino.dart';

import '../constants.dart';

abstract class BaseProvider with ChangeNotifier {
  var isLoading = false;
  var errorMessage = "";
  BaseError? _error;

  final noInternetConnectionEvent = false;
  final connectTimeoutEvent = false;

  // void onLoadFail(Exception exception) {
  //   isLoading = false;
  //   showErrorWithString(exception.toString());
  //
  //   notifyListeners();
  // }

  void showErrorWithString(String message) {
    errorMessage = message;

    notifyListeners();
  }

  void showError(BaseError error) {
    _error = error;

    notifyListeners();
  }

  void showLoading() {
    isLoading = true;

    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;

    notifyListeners();
  }
}
