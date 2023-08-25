import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();

  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  
  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> SignInAnonymously() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential? userCredential = await firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      res = {
        'user': user,
      };
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'operation-not-allowed':
          res = {'error': 'Server Temporary Closed...'};
          break;
      }
    }

    return res;
  }

  
  Future<Map<String, dynamic>> createUserWithEmailPassword(
      {required String? email, required String? password}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential? userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User? user = userCredential.user;
      res = {
        'user': user,
      };
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("-----------------------");
      }
      if (kDebugMode) {
        print(e.code);
      }
      if (kDebugMode) {
        print("-----------------------");
      }
      switch (e.code) {
        case 'invalid-email':
          res = {'error': 'Invalid Email....'};
          break;
        case 'weak-password':
          res = {'error': 'Your Password is Weak....'};
          break;
        case 'operation-not-allowed':
          res = {'error': 'Server is temporary off....'};
          break;
        case 'email-already-in-use':
          res = {'error': 'Please select another email....'};
          break;
      }
    }
    return res;
  }
}
