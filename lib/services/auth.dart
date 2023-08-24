import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _database = FirebaseDatabase.instance;

  Future<String> registerUser(
      {required String email,
      required String fullName,
      required String password,
      required String gender,
      required String phoneNo,
      required DateTime dob,
      required String idProof,
      required String systemCode}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      user!.updateDisplayName(fullName);

      user.reload();

      await _firestore
          .collection('users')
          .doc("${user.email}${user.phoneNumber!}")
          .set({
        "email": email,
        "phoneNo": phoneNo,
        "gender": gender,
        "dob": dob,
        "fullName": fullName,
        "idProof": idProof,
        "systemCode": systemCode,
        "password": password,
      });

      await _database
          .ref("users/${user.email}${user.phoneNumber!}")
          .set({"systemCode": systemCode, "data": {}});

      return "Welcome ${fullName.split(" ")[0]}";
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }
}
