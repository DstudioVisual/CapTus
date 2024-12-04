import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PrincipalsController {
  final sheard = TextEditingController();
  late BuildContext context;
  late Function refresh;
  late File? imageFile = null;

  void init(BuildContext context, refresh) {
    this.context = context;
    this.refresh = refresh;
  }

  void showAlertDialog() {
    Widget galleryButton = TextButton(
      onPressed: () {
        getImageFromGallery(ImageSource.gallery);
        refresh();

      },
      child: const Text('GALERIA'),
    );

    Widget cameraButton = TextButton(
      onPressed: () {
        getImageFromGallery(ImageSource.camera);
        refresh();

      },
      child: const Text('CAMARA'),
    );

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona tu imagen'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  void mensaje(String mensaje, var type) {
    AnimatedSnackBar.material(
      mensaje,
      type: type,
    ).show(context);
  }

  Future getImageFromGallery(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
       imageFile = File(pickedFile.path);
      refresh();
      try {


        mensaje('Imagen actualizo con exito', AnimatedSnackBarType.success);
      } catch (e) {
        print('Error al subir la imagen: $e');

        mensaje(
            'Ocurrio un error al subir la imagen', AnimatedSnackBarType.error);
      }
    } else {
      print('No seleccionó ninguna imagen');
      mensaje('No selecciono ninguna imagen', AnimatedSnackBarType.warning);
    }
    Navigator.pop(context);
    refresh();
  }


}