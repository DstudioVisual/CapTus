import 'dart:io';

import 'package:CapTus/functions/principals/principals_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class PrincipalsPage extends StatefulWidget {
  const PrincipalsPage({super.key});

  @override
  _PrincipalsPageState createState() => _PrincipalsPageState();
}

class _PrincipalsPageState extends State<PrincipalsPage> {
  int selectedIndex = 1; // Índice de la pestaña seleccionada
  late PageController controller; // Controlador para PageView
 final PrincipalsController _con = PrincipalsController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
    controller = PageController(initialPage: selectedIndex);
  }
  refresh(){
    setState(() {

    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          SingleChildScrollView(

            child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  confi('Mi Perfil', Icons.verified_user, (){
                    Navigator.pushNamed(context, 'edit');
                  }),
                  SizedBox(height: 20,),
                  confi('Mensajes', Icons.message,(){
                    Navigator.pushNamed(context, 'home2');
                  }),
                  SizedBox(height: 20,),
                  confi('Politicas de privacidad', Icons.policy,(){
                    Navigator.pushNamed(context, 'politicas');
                  }),
                  SizedBox(height: 20,),
                  confi('Acerca de nosotros', Icons.supervised_user_circle_sharp,(){}),
                  SizedBox(height: 20,),
                  confi('Cerrar Sesion', Icons.exit_to_app,(){
                    deleteTypeUser();
                    Navigator.pushNamed(context, 'splash');
                  }),
                  SizedBox(height: 20,),
            ],),)
          ],),),
    SingleChildScrollView(
    child:
          Container(child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              Container(
                child: Column(children: [
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10,),
                    _buttonAdd(),
                  ],),
                  Container(margin: EdgeInsets.symmetric(horizontal: 30),child:userInput(_con.sheard, TextInputType.text, false),),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

                Column(children: [
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                    SizedBox(height: 20,),
                    plants(),
                  ],),

                ],
                 ),)
            ],
          ),),),
         Column(

              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,),
                  width: MediaQuery.of(context).size.width,

                  child: Column(children: [
                    Text('Checa tu planta con la inteligencia artificial', style: GoogleFonts.interTight(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    //fontStyle: FontStyle.italic,
                  ),),
                    SizedBox(height: 5,),
                    Text('Selecciona una imagen', style: GoogleFonts.interTight(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      //fontStyle: FontStyle.italic,
                    ),),

                  ],),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    //border: Border.all(color: Colors.orangeAccent, width: 2), // Contorno naranja
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black, // Color de la sombra
                        blurRadius: 10,        // Radio de desenfoque de la sombra
                        offset: Offset(5, 5),  // Desplazamiento de la sombra en x e y
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height * 0.8,
              child:
                     SingleChildScrollView(

                       child:Column(children: [
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                           
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: const BorderRadius.all(Radius.circular(20)),
                             //border: Border.all(color: Colors.orangeAccent, width: 2), // Contorno naranja
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black, // Color de la sombra
                                 blurRadius: 10,        // Radio de desenfoque de la sombra
                                 offset: Offset(5, 5),  // Desplazamiento de la sombra en x e y
                               ),
                             ],
                           ),
                           child:   GestureDetector(onTap: (){_con.showAlertDialog();},child:  Image(image: _con.imageFile != null
                               ? FileImage(File(_con.imageFile!.path))
                               : const AssetImage('assets/img/hs.png')
                           as ImageProvider<Object>)),),
                         Container(
                             alignment: Alignment.center,
                             child: Column(
                               children: [
                                 Text('Analizando...'),
                               ],)),
                         SizedBox(height: 30,),
                         Container(
                              alignment: Alignment.topLeft,
                             margin: EdgeInsets.symmetric(horizontal: 30),
                             child: Column(
                               children: [

                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     'Hemos detectado un problema en el cactus. Presenta los siguientes síntomas: '
                                         'manchas negras en los tallos, textura blanda al tacto, y un crecimiento inclinado hacia un lado. '
                                         'Esto podría deberse a varias causas, como exceso de riego, falta de luz o un sustrato inadecuado.',
                                     textAlign: TextAlign.justify,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     'Pasos para arreglar el problema:',
                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                   ),
                                 ),
                                 Text('- Retira el cactus de la maceta y revisa las raíces cuidadosamente.'),
                                 Text('- Si encuentras raíces podridas, corta las áreas afectadas con tijeras desinfectadas.'),
                                 Text('- Deja el cactus secar al aire durante 24-48 horas para permitir la cicatrización.'),
                                 Text('- Usa una maceta con buen drenaje y rellénala con sustrato específico para cactus.'),
                                 SizedBox(height: 20),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     'Prevención a futuro:',
                                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                   ),
                                 ),
                                 Text(
                                   '- Riega el cactus solo cuando el sustrato esté completamente seco. '
                                       'Evita encharcamientos o acumulación de agua en el plato de la maceta.',
                                 ),
                                 Text(
                                   '- Asegúrate de que reciba suficiente luz, preferiblemente indirecta y brillante. '
                                       'Si está en interiores, colócalo cerca de una ventana bien iluminada.',
                                 ),
                                 Text(
                                   '- Inspecciona regularmente el cactus para detectar posibles plagas, como cochinillas o ácaros, '
                                       'y actúa rápidamente si las encuentras.',
                                 ),
                                 SizedBox(height: 20),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     'Con estos cuidados, tu cactus estará saludable y crecerá fuerte. 🌵',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                                   ),
                                 ),

                               ],))
                       ],),)

                ),



              ],
              ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Text('Novedades', style: GoogleFonts.interTight(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 40,
    color: Colors.black,
    fontWeight: FontWeight.bold
    //fontStyle: FontStyle.italic,
    ),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

            Container(
              height: MediaQuery.of(context).size.height * 0.8,
            width:MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                //border: Border.all(color: Colors.orangeAccent, width: 2), // Contorno naranja
                boxShadow: [
                  BoxShadow(
                    color: Colors.black, // Color de la sombra
                    blurRadius: 10,        // Radio de desenfoque de la sombra
                    offset: Offset(5, 5),  // Desplazamiento de la sombra en x e y
                  ),
                ],
              ),



            )
          ]

          ),)
          // Agrega más páginas si es necesario
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(
            selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.settings,
            title: 'Configuracion',
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          BarItem(
            icon: Icons.person,
            title: 'Mis plantas',
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'IA',
            activeColor: Colors.red,
            inactiveColor: Colors.red,
          ),
          BarItem(
            icon: Icons.show_chart_sharp,
            title: 'Novedades',
            activeColor: Colors.orangeAccent,
            inactiveColor: Colors.orangeAccent,
          ),
          // Puedes agregar más elementos de barra aquí
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
          color: Colors.black,
        ),
      ),
      cursorColor: Colors.black,
      controller: userInput,
      keyboardType: keyboardType,
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: 'Buscar',
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Línea negra cuando no está enfocado
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Línea negra cuando está enfocado
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
  Widget plants(){
    return       Container(
      width: MediaQuery.of(context).size.width,
      child:
      Column(
        children: [
          Container(
            margin:EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              //border: Border.all(color: Colors.orangeAccent, width: 2), // Contorno naranja
              boxShadow: [
                BoxShadow(
                  color: Colors.black, // Color de la sombra
                  blurRadius: 10,        // Radio de desenfoque de la sombra
                  offset: Offset(5, 5),  // Desplazamiento de la sombra en x e y
                ),
              ],
            ),
            child: Column(children: [
              SizedBox(height: 5,),
              Row(children: [
                SizedBox(width: 20,),
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(width: 20,),
                Text('Nombre de la planta')
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temperatura:  °30'),
                  SizedBox(width: 20,),

                  Text('Humedad: 40%'),

                ],),
              SizedBox(height: 5,),

            ],),)
        ],),);
  }
  Widget confi(String text, IconData icons, Function onTapAction) {
    return GestureDetector(
      onTap: () {
        // Ejecutar la acción que se pasa como parámetro
        onTapAction();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Icon(icons, size: 30),
                      SizedBox(width: 30),
                      Text(text, style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> deleteTypeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('type');
  }
  Widget _buttonAdd() {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          shape: const CircleBorder(),
          color: Colors.grey,
          elevation: 4.0,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }


}
