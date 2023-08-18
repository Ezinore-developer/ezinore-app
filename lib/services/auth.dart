// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';

// import '../models/UserModel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Auth {
  Future<String> registerUser(
      {required String email,
      required String fullName,
      required String password,
      required String dob,
      required String idProof,
      required String systemCode,
      required String gender,
      required String phoneNo}) async {
    try {
      final result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = result.user;

      await user!.updateDisplayName(fullName);

      await user.reload();
      // PhoneAuthCredential credential = PhoneAuthCredential.fromFirebaseAuth(
      // FirebaseAuth.instance.currentUser!);

      await FirebaseDatabase.instance.ref('users/$systemCode').set({
        'name': fullName,
        'email': email,
        'dob': dob,
        'idProof': idProof,
        'systemCode': systemCode,
        'gender': gender,
        'phoneNo': phoneNo,
        'data': ''
      });

      // await user.updatePhoneNumber));

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
