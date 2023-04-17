import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  //Login With Creds
  Future<void> signInWithCreds(String email, String password) async {
    print("Signing In With Cred");
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
    print("Done Signing In With Cred");
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
