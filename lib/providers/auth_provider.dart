import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  late FirebaseAuth _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  void checkIfUserisLogged(BuildContext context, String typeUser) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // que si el usuario esta logeado
      if (user != null) {
        if (typeUser == 'Client') {
          print('El usuario esta logueado');
          Navigator.pushNamedAndRemoveUntil(context, 'map', (route) => false);
        }
      } else {
        print('El usuario no esta logeado');
      }
    });
  }

  Future<bool> login(String email, String password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      //Correo invalido
      //password incorrecto
      //no hay conexion de internet
      if (error is FirebaseAuthException) {
        errorMessage = error.code;
      } else {
        errorMessage = 'Unknown error occurred.';
      }
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
    return true;
  }

  Future<bool> register(String email, String password) async {
    String? errorMessage;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      //Correo invalido
      //password incorrecto
      //no hay conexion de internet
      if (error is FirebaseAuthException) {
        errorMessage = error.code;
      } else {
        errorMessage = 'Unknown error occurred.';
      }
    }
    if (errorMessage != null) {
      return Future.error(errorMessage);
    }
    return true;
  }

  Future<Future<List<void>>> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }
}
