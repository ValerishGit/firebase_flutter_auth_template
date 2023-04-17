import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../modals/user_model.dart';
import '../services/firebase_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMsg = "".obs;
  UserClass activeUser = UserClass();
  FirebaseAuth auth = FirebaseAuth.instance;
  //Login With Creds
  Future<void> signInWithCreds(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      errorMsg("Fields cant be empty");
      return;
    }
    try {
      isLoading(true);
      UserCredential creds = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorMsg(FirebaseErrorHandler.showErrorMessage(e));
    } finally {
      isLoading(false);
    }
  }

  //Login With Facebook
  Future<void> signInWithFacebook() async {
    isLoading(true);

    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
  }

  //Login With Google
  Future<void> signInWithGoogle() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
  }
}
