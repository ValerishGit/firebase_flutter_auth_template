import 'package:flutter/foundation.dart';

class FirebaseErrorHandler {
  static String showErrorMessage(e) {
    if (kDebugMode) {
      print(e.message);
    }
    switch (e.code) {
      case "invalid-email":
        return e.message;
      case "user-not-found":
        return ("Wrong Credentials");
      case "wrong-password":
        return ("Wrong Credentials");
      case 'user-disabled':
        return "User is disabled";
      default:
        return "Error has Occured";
    }
  }
}
