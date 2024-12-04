import 'package:CapTus/functions/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _con = SplashController();
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }
  refresh(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Image.asset(
            'assets/img/logo.png',
            height: MediaQuery.of(context).size.height * 0.3,
          ),          ),
      ),
    );
  }

}