import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../providers/auth_provider.dart';
import '../login/login_page.dart';

class RegisterController {
  late BuildContext context;
  late Function refresh;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final nombreController = TextEditingController();
  final controlController = TextEditingController();

  final celularController = TextEditingController();
  bool isValidPassword = false;

  late final SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void init(BuildContext context, Function() refresh) {
    this.context = context;
    this.refresh = refresh;
  }

  Future<void> register() async {
    loading();
    mensaje('Se ha registrado con exito!',
        AnimatedSnackBarType.success);
    _dialog.hide();
    signOut();
  }


  passwordCheck() {
    String password = passwordController.text;
    String confirmpassword = passwordController.text;

      if (password == confirmpassword) {
        return true;
      }
      mensaje('Las contraseñas no coinciden ', AnimatedSnackBarType.warning);
      _dialog.hide();
      return false;

  }


  void mensaje(String mensaje, var type) {
    AnimatedSnackBar.material(
      mensaje,
      type: type,
    ).show(context);
  }

  Future<void> saveTypeUser(String s) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('type', s);
  }


  Future<void> loading() async {
    _dialog.show(
        message: 'Verificando...',
        type: SimpleFontelicoProgressDialogType.phoenix);
  }


  campos() {
    if (emailController.text.isEmpty) {
      mensaje('Ingresa un correo electronico', AnimatedSnackBarType.error);
      _dialog.hide();

      return false;
    }
    if (passwordController.text.isEmpty) {
      mensaje('Ingresa una contraseña', AnimatedSnackBarType.error);
      _dialog.hide();

      return false;
    }
    if (nombreController.text.isEmpty) {
      mensaje('Ingresa tu nombre completo', AnimatedSnackBarType.error);
      _dialog.hide();

      return false;
    }
    if (celularController.text.isEmpty) {
      mensaje('Ingresa tu numero de celular', AnimatedSnackBarType.error);
      _dialog.hide();

      return false;
    }
   register();
  }


  checknumero(String celular) async {
    try {
      CollectionReference usersCollection = FirebaseFirestore.instance
          .collection('Users');
      //TODO: Verificar si el número de celular ya está registrado en otra cuenta
      QuerySnapshot querySnapshot = await usersCollection
          .where('cellnumber', isEqualTo: celular)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        // El número de celular ya está registrado en otra cuenta
        _dialog.hide();
        mensaje(
            'Ya se encuentra registrado el numero de celular en otra cuenta',
            AnimatedSnackBarType.error);
        _dialog.hide();

        return false;

      } else {
        return true;
      }
    }
    catch(e){
      print(e);
      _dialog.hide();
      return false;
    }
  }

  void signOut() {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (value)=>false);
  }

  bool checkEmailSchool(String email) {
    const String domain = '@delicias.tecnm.mx';
    return email.endsWith(domain);
  }

}