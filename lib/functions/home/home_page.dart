import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_button_builder/custom_button_builder.dart';

import 'home_controller.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _con = HomeController();
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
      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: AssetImage(
                  // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                    'assets/img/fondo.jpeg'),
                fit: BoxFit.cover,
                opacity: 0.7)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      // _formKey!.currentState!.validate() ? 200 : 600,
                      // height: isEmailCorrect ? 260 : 182,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(child: Column(
                          children: [
                            Image.asset('assets/img/logo.png'),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                            button('Iniciar sesion', 'login'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('No tienes cuenta?',style: GoogleFonts.interTight(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                  //fontStyle: FontStyle.italic,
                                ), ),
                                TextButton(onPressed: (){Navigator.pushNamed(context, 'register');}, child: Text('Registrarme', style: GoogleFonts.interTight(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                  //fontStyle: FontStyle.italic,
                                ),))
                              ],
                            )

                          ])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget button (String name, String page){
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20), // 20 píxeles a la izquierda y derecha
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.07),
          backgroundColor: Colors.white,
          elevation: 0, // Sin sombras
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () {
          _con.page(page);
        },
        child: Text(
          name,
          style:  GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 20,
              fontWeight: FontWeight.bold
            //fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}