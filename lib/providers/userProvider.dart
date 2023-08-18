import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User extends ChangeNotifier {
  String? _firstName = "";
  String? _lastName = "";
  String? _email = "";
  String? _phone = "";
  String? _password = "";
  String? _address = "";
  String? _dob = "";
  String? _gender = "";
  String? _idProof = "";
  String? _systemCode = "";

  void setFirstName(String name) {
    _firstName = name;
    notifyListeners();
  }

  void setLastName(String name) {
    _lastName = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void setAddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setDob(String dob) {
    _dob = dob;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setIdProof(String idProof) {
    _idProof = idProof;
    notifyListeners();
  }

  void setSystemCode(String systemCode) {
    _systemCode = systemCode;
    notifyListeners();
  }

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get dob => _dob;
  String? get gender => _gender;
  String? get idProof => _idProof;
  String? get systemCode => _systemCode;
  String? get password => _password;
}

final userProvider = ChangeNotifierProvider<User>((ref) => User());
