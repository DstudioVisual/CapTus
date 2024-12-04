import 'dart:io';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'edit_controller.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final EditController _con = EditController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _con.key,
        body: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Mi ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            children: [
                              TextSpan(
                                text: 'Perfil',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ]),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      GestureDetector(
                        onTap: _con.showAlertDialog,
                        child: CircleAvatar(
                          backgroundImage: _con.imageFile != null
                              ? FileImage(File(_con.imageFile!.path))
                              : (_con.user?.image != null &&
                              _con.user!.image.isNotEmpty
                              ? NetworkImage(_con.user?.image ?? "")
                              : const AssetImage('assets/img/profile.png')
                          as ImageProvider<Object>),
                          radius: 50,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Nombre Completo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    enabled: false,
                                    controller: _con.usernameController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Numero de telefono",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    controller: _con.cellnumberController,
                                    // obscureText: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true))
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.61,
                        backgroundColor: Colors.white,
                        shadowColor: Colors.black,
                        isThreeD: true,
                        height: 40,
                        borderRadius: 25,
                        animate: true,
                        margin: const EdgeInsets.all(10),
                        onPressed: () {
                          _con.update();
                        },
                        child: const Text(
                          'Actualizar',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      SizedBox(height: height * .055),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, bottom: 10),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        const Text('Regresar',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
