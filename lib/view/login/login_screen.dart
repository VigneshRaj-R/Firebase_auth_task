import 'package:flutter/material.dart';
import 'package:login_task/controller/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var phoneNum = ''.obs;
    final phoneNumber = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                  labelText: 'Phone Number', prefixText: '+91 '),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print("Get OTP activated");
                  var phnum = phoneNumber.text.trim().toString();
                  print(phnum);
                  LoginController().phoneAuthentication(phnum);
                  // print("${phoneNumber.text}");
                  //  LoginControllers().signInWithPhoneNumber(phoneNumber.text);
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: phoneNum,
                  //   verificationCompleted: (phoneAuthCredential) async{

                  //   },
                  //   verificationFailed: (error) {},
                  //   codeSent: (verificationId, forceResendingToken) {
                  //     Navigator.pushNamed(context, "LoginScreen");
                  //   },
                  //   codeAutoRetrievalTimeout: (verificationId) {},
                  // );
                },
                child: const Text("Get OTP")),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              //controller: ,
              decoration: const InputDecoration(
                labelText: "OTP",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
