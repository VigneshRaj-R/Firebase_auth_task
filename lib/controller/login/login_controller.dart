import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationId1 = ''.obs;
  //Phone Authentication Function
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (phoneAuthCredential) async {
        print(phoneNo);
        await _auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar("Error", "The provided phone number is not valid");
        } else {
          Get.snackbar("Error", "Something went wrong, try again");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationId1.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        verificationId1.value = verificationId;
      },
    );
  }

//OTP verification
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId1.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
