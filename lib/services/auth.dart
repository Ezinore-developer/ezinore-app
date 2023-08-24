import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<String> registerUser(
      {required String email,
      required String fullName,
      required String password,
      required String gender,
      required String phoneNo,
      required String dob,
      required String idProof,
      required String systemCode}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      user!.updateDisplayName(fullName);

      user.reload();

      return "Welcome ${fullName.split(" ")[0]}";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  // Future<String> registerUser(){

  // }
}
