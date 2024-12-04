import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../providers/auth_provider.dart';

class LoginController {
  late BuildContext context;
  late Function refresh;
  late final SimpleFontelicoProgressDialog _dialog =
      SimpleFontelicoProgressDialog(context: context);
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void init(BuildContext context, Function() refresh) {
    this.context = context;
    this.refresh = refresh;
  }

  Future<void> campos() async {
    loading();
    String email = emailController.text.trim();
    bool bemail = await EmailValidator.validate(email);
    if (bemail) {
      saveTypeUser('User');
      login();
    } else {
      _dialog.hide();
      mensaje('Correo no valido', AnimatedSnackBarType.error);
    }
  }

  Future<void> loading() async {
    _dialog.show(
        message: 'Verificando...',
        type: SimpleFontelicoProgressDialogType.phoenix);
  }

  Future<void> login() async {
    Navigator.pushNamedAndRemoveUntil(context, 'principals', (route) => false);
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
}
