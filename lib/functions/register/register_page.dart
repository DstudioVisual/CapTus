import 'package:CapTus/functions/register/register_controller.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _con = RegisterController();
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            'Regresar',
                            style: GoogleFonts.interTight(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              //fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                            Text('Registro', style: GoogleFonts.interTight(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              color: Colors.white
                              //fontStyle: FontStyle.italic,
                            ),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),

                              child: Column( children: [
                                Row(children: [
                                  Text('Nombre completo', style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    color: Colors.white
                                    //fontStyle: FontStyle.italic,
                                  ),),
                                ],),
                                userInput(_con.nombreController, TextInputType.emailAddress, false),
                              ],),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),

                              child: Column( children: [
                                Row(children: [
                                  Text('Numero de celular', style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    //fontStyle: FontStyle.italic,
                                  ),),
                                ],),
                                userInput(_con.celularController, TextInputType.emailAddress, false),
                              ],),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),

                              child: Column( children: [
                                Row(children: [
                                  Text('Correo', style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    //fontStyle: FontStyle.italic,
                                  ),),
                                ],),
                                userInput(_con.emailController, TextInputType.emailAddress, false),
                              ],),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),

                              child: Column( children: [
                                Row(children: [
                                  Text('Password', style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    //fontStyle: FontStyle.italic,
                                  ),),
                                ],),
                                userInput(_con.passwordController, TextInputType.visiblePassword, true),
                              ],),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),

                              child: Column( children: [
                                Row(children: [
                                  Text('Confirmar password', style: GoogleFonts.interTight(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    //fontStyle: FontStyle.italic,
                                  ),),
                                ],),
                                userInput(_con.confirmpasswordController, TextInputType.emailAddress, true),
                              ],),),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                            button('Registrarme'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Ya tienes cuenta?',style: GoogleFonts.interTight(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                  //fontStyle: FontStyle.italic,
                                ), ),
                                TextButton(onPressed: (){Navigator.pushNamed(context, 'login');}, child: Text('Iniciar sesion', style: GoogleFonts.interTight(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                  //fontStyle: FontStyle.italic,
                                ),))
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                          ])))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget button (String name){
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20), // 20 píxeles a la izquierda y derecha
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.07),
          backgroundColor: Colors.white,
          elevation: 10, // Sin sombras
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.all(10),
        ),
        onPressed: () {
          _con.campos();
        },
        child: Text(
          name,
          style: GoogleFonts.interTight(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 30,
              fontWeight: FontWeight.bold
            //fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
  Widget login(IconData icon, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: const Text('Ya tengo una cuenta')),
        ],
      ),
    );
  }

  Widget userInput(
      TextEditingController userInput, TextInputType keyboardType, bool obscured) {
    return TextField(
      style: GoogleFonts.interTight(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
      cursorColor: Colors.white,
      controller: userInput,
      keyboardType: keyboardType,
      obscureText: obscured,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Línea blanca cuando no está enfocado
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Línea blanca cuando está enfocado
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Línea roja en caso de error
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Línea roja en caso de error y enfoque
        ),
      ),
    );
  }

}