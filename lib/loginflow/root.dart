// import 'package:ezinore_app/amplifyconfiguration.dart';
import 'package:ezinore_app/loginflow/addressscreen.dart';
import 'package:ezinore_app/loginflow/datescreen.dart';
import 'package:ezinore_app/loginflow/emailscreen.dart';
import 'package:ezinore_app/loginflow/genderscreen.dart';
import 'package:ezinore_app/loginflow/idProofScreen.dart';
import 'package:ezinore_app/loginflow/login.dart';
import 'package:ezinore_app/loginflow/namescreen.dart';
import 'package:ezinore_app/loginflow/passwordscreen.dart';
import 'package:ezinore_app/loginflow/paymentMethod.dart';
// import 'package:ezinore_app/loginflow/phonenoscreen.dart';
import 'package:ezinore_app/loginflow/systemcode.dart';
// import 'package:ezinore_app/loginflow/verificationCode.dart';
import 'package:flutter/material.dart';

class LoginRoot extends StatefulWidget {
  const LoginRoot({super.key});

  @override
  State<LoginRoot> createState() => _LoginRootState();
}

class _LoginRootState extends State<LoginRoot> {
  final _pageController = PageController();

  @override
void initState() {
  super.initState();

  // _configureAmplify();
}

// void _configureAmplify() async {
//   try {
//     // await Amplify.addPlugin(AmplifyAuthCognito());
//     // await Amplify.configure(amplifyconfig);
   
//     print('Successfully configured');
//   } on Exception catch (e) {
//     print('Error configuring Amplify: $e');
//   }
// }

  void onClick() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void onClickBack() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        NameScreen(onClick: onClick),
        DateScreen(
          onClick: onClick,
          onClickBack: onClickBack,
        ),
        GenderScreen(onClick: onClick, onClickBack: onClickBack),
        EmailScreen(onClick: onClick, onClickBack: onClickBack),
        AddressScreen(onClick: onClick, onClickBack: onClickBack),
        // PhoneNoScreen(onClick: onClick, onClickBack: onClickBack),
        IdProofScreen(onClick: onClick, onClickBack: onClickBack),
        SystemCodeScreen(onClick: onClick, onClickBack: onClickBack),
        PasswordScreen(onClick: onClick, onClickBack: onClickBack),
        PaymentMethodScreen(onClick: onClick, onClickBack: onClickBack),
        LoginScreen(onClickBack: onClickBack)
      ],
    );
  }
}
