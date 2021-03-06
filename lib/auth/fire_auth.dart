import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String? tempErrEmail, tempErrPass;
String? tempRegisterErrEmail, tempRegisterErrPass;
String? dataEmail;

class FireAuth {
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        tempRegisterErrPass = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        tempRegisterErrEmail = "The account already exists for that email.";
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      dataEmail = user?.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        tempErrEmail = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        tempErrPass = 'Wrong password provided.';
      }
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static Future<void> signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  static Future<String?> getDataUser() async => dataEmail;
}

class Validator {
  static String? validateName({required String name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Masukkan email yang benar';
    } else if (tempErrEmail == "No user found for that email.") {
      tempErrEmail = '';
      return "EmaiL user tidak terdaftar";
    } else if (tempRegisterErrEmail ==
        "The account already exists for that email.") {
      tempRegisterErrEmail = '';
      return "Akun telah terdaftar";
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (password.length < 6) {
      return 'Panjang password minimal 6 karakter';
    } else if (tempErrPass == "Wrong password provided.") {
      tempErrPass = '';
      return 'Password salah';
    } else if (tempRegisterErrEmail == "The password provided is too weak.") {
      tempRegisterErrEmail = '';
      return 'Password lemah';
    }

    return null;
  }
}
