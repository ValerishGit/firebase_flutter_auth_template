import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  //Login With Creds
  Future<void> signInWithCreds(String email, String password) async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
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
