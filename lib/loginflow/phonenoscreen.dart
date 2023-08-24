import 'package:ezinore_app/loginflow/verificationCode.dart';
import 'package:ezinore_app/providers/userProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PhoneNoScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const PhoneNoScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<PhoneNoScreen> createState() => _PhoneNoScreenState();
}

class _PhoneNoScreenState extends ConsumerState<PhoneNoScreen> {
  final _phoneNo = TextEditingController();

  @override
  void initState() {
    super.initState();

    // if (ref.read(userProvider).phone != "") {
    //   _phoneNo.text = ref.read(userProvider).phone!;
    // } else {
    //   _phoneNo.text = "";
    // }

    _phoneNo.text = ref.read(userProvider).phone!;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  void func() async {
    final phoneNumber = "+91${_phoneNo.text.trim()}";

    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Navigate to the next screen, you can decide what to do after successful login.
        await auth.signInWithCredential(credential);
        // await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed.
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationCodeScreen(
              verificationId: verificationId,
              onClick: widget.onClick,
              onClickBack: widget.onClickBack,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: widget.onClickBack,
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      Text(
                        "6/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 32),
                      Text("Enter your phone number",
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 32),
                      TextField(
                        controller: _phoneNo,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setPhone(_phoneNo.text);
                    // widget.onClick();
                    func();
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
