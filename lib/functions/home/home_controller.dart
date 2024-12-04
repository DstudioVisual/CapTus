import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeController {
  late BuildContext context;
  late Function refresh;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  void init(BuildContext context, Function() refresh) {
    this.context = context;
    this.refresh = refresh;

  }

  void page(String page) {
    Navigator.pushNamed(context, page);
  }
}