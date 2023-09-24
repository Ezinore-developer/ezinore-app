import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class VerificationCodeScreen extends StatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  final String verificationId;
  const VerificationCodeScreen(
      {super.key,
      required this.onClick,
      required this.onClickBack,
      required this.verificationId});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  // final _age = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  List<int> otp = [];

  Future<void> signInWithOtp() async {
    // final credential = PhoneAuthProvider.credential(
    //   verificationId: widget.verificationId,
    //   smsCode: otp.join(''),
    // );

    // try {
    //   final result = await _auth.signInWithCredential(credential);

    //   final user = result.user;

    //   await user!.updatePhoneNumber(credential);

    //   await user.reload();
    // }  catch (e) {
    //   log(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: widget.onClickBack,
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      // Text(
                      //   "2/10",
                      //   style: Theme.of(context).textTheme.headlineSmall,
                      // )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Verification Code",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 32),
                      Text(
                          "We have sent a verification code at your registered email id ",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 32),
                      Text(
                        "Enter OTP",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _controllers.map<Widget>((e) {
                          return SizedBox(
                              width: 50.0,
                              child: TextField(
                                controller: e,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    otp.add(int.parse(value));
                                    if (_controllers.indexOf(e) !=
                                        _controllers.length - 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  }
                                },
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    signInWithOtp();
                    Navigator.of(context).pop();
                  },
                  child: Text('Next',
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
