import 'dart:async';
import 'package:CapTus/models/user.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../providers/auth_provider.dart';
import '../../providers/storage_user_provider.dart';
import '../../providers/user_provider.dart';

class EditController {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  late BuildContext context;
  late Function refresh;
  TextEditingController usernameController = TextEditingController();
  TextEditingController cellnumberController = TextEditingController();
  late AuthProvider auth;
  //ProgressDialog //_progressDialog;
  late StorageUserProvider _storageProvider;
  late UserProvider _userProvider;
  late PickedFile? pickedFile = null;
  late File? imageFile = null;
  late UserModel user = UserModel(id: '', username: '', email: '', image: '', token: '', role: 0, blocked: false, cellNumber: '', control: '');
  late bool pantalla = false;
  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    auth = AuthProvider();

    _userProvider = UserProvider();
    _storageProvider = StorageUserProvider();
  }

  void deleteTypeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('typeUser');
  }



  void mensaje(String mensaje, var type) {
    AnimatedSnackBar.material(
      mensaje,
      type: type,
    ).show(context);
  }

  void showAlertDialog() {
    Widget galleryButton = TextButton(
      onPressed: () {
        getImageFromGallery(ImageSource.gallery);
      },
      child: const Text('GALERIA'),
    );

    Widget cameraButton = TextButton(
      onPressed: () {
        getImageFromGallery(ImageSource.camera);
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

  Future getImageFromGallery(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);

      try {
        final storage = FirebaseStorage.instance;
        final ref =
        storage.ref().child('profile_images/${auth.getUser()!.uid}');
        final task = ref.putFile(imageFile);
        await task.whenComplete(() {
          // La imagen se ha subido con éxito
        });

        // Obtener la URL de descarga de la imagen subida
        String imageUrl = await ref.getDownloadURL();

        // Actualizar la imagen en la base de datos del conductor
        Map<String, dynamic> data = {
          'image': imageUrl,
        };

        await _userProvider.update(data, auth.getUser()!.uid);

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

  void update() async {
    String cellnumbers = cellnumberController.text;
    //_progressDialog.show();
    if (pickedFile == null) {
      Map<String, dynamic> data = {
        'image': user?.image,
        'cellnumber': cellnumbers,
      };
      await _userProvider.update(data, auth.getUser()!.uid);
      mensaje('Ha actualizado los datos exitosamente',
          AnimatedSnackBarType.success);

      principal();
////_progressDialog.hide();
    } else {
      TaskSnapshot snapshot = await _storageProvider.uploadFile(pickedFile!);
      String imageUrl = await snapshot.ref.getDownloadURL();

      Map<String, dynamic> data = {
        'image': imageUrl,
        'cellnumber': cellnumbers,
      };

      await _userProvider.update(data, auth.getUser()!.uid);
      mensaje('Ha actualizado los datos exitosamente',
          AnimatedSnackBarType.success);

      principal();
    }
  }

  void principal() {
    Navigator.pushNamedAndRemoveUntil(context, 'principalpage', (route) => false);
  }
}
