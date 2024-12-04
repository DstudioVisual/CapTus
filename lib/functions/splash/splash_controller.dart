import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashController  {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  late BuildContext context;
  late Function refresh;
  Future<void> init(BuildContext context, Function refresh) async {
    this.context =context;
    this.refresh = refresh;
    await login();
  }

  Future<void> login() async {
    //TODO: Verifica si el usuario inicio sesion
    final prefs = await SharedPreferences.getInstance();
    String type = prefs.getString('type').toString();
    if (type == 'User')
    {
      Navigator.pushNamedAndRemoveUntil(context, 'principals', (route) => false);
    }
    else
      {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      }
    }
  }
