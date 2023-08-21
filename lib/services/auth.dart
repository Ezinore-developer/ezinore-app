// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';

// import '../models/UserModel.dart';

import 'package:amplify_core/amplify_core.dart';

import '../models/UserModel.dart';

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
      final item = UserModel(
          name: fullName,
          email: email,
          phoneNo: phoneNo,
          password: password,
          gender: gender,
          dob: dob,
          idProof: idProof,
          systemCode: systemCode);
      await Amplify.DataStore.save(item);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}
