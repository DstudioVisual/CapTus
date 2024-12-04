import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:CapTus/providers/user_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart' as auths;
import 'package:http/http.dart' as http;

class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> saveToken(String idUser, String typeUser) async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    // Verificar si es un dispositivo iOS
    if (Platform.isIOS) {
      // Obtener el token APNS (solo para iOS)
      String? apnsToken = await firebaseMessaging.getAPNSToken();

      if (apnsToken == null) {
        print('El token APNS no se ha establecido aún.');
        // Esperar un poco y reintentar
        await Future.delayed(Duration(seconds: 5));
        apnsToken = await firebaseMessaging.getAPNSToken();

        if (apnsToken == null) {
          print('El token APNS sigue sin estar disponible.');
          return;
        }
        Map<String, dynamic> data = {
          'token': apnsToken,
        };
        if (typeUser == 'User') {
          UserProvider userProvider = UserProvider();
         userProvider.update(data, idUser);
        }
      }
    }

    // Obtener el token de Firebase Messaging (para iOS y Android)
    String? token = await firebaseMessaging.getToken();
    if (token == null) {
      print('El token de Firebase Messaging no está disponible.');
      return;
    }

    Map<String, dynamic> data = {
      'token': token,
    };

    if (typeUser == 'User') {
      UserProvider userProvider = UserProvider();
      userProvider.update(data, idUser);
    }
  }

  Future<String> getAccessToken() async {
    try {
      final serviceAccountJson = {
        "type": "service_account",
        "project_id": "tecdelicias-difusion",
        "private_key_id": "404f2bf1fec51575176d029c149faebcf6666eea",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDspOXU3nT+OOoY\nkrs0kQU5VLE+5FVRBezLNKTuSnA4KF4zOE0RtUP7/tlZLcw+NLQWql050TlGn6pX\nPWkNqF7Npl9unfSDWqndHMtdn8BINeCTQB5vDXqeQexblxjU6k/HpLyznSOLGfFr\n5VfFS0rpZ7knPvc14doq7UgzI/8aoluHnNwDkQsJgPELZ8IBGx52a9EbNOrrU9Hq\nd+49UsGCfJ4R5JZRk+tznbsS7/pIG3dHMwzhMi5Z6B1IOlJCxI4FxXyNRCFJWN6T\nRgKbtJgpkVVPOSdNIkomC70vJf8keJ289yqGFcYPihgYVIR5moSrFB/vkMtVoIGu\nMH3qiCofAgMBAAECggEAIfRhI+ONfuK0uDTplpfOW5UK357MnRUQDnItziExK+Wi\n6o+EA2vyZsiA8DpRiYVvZ6cnPEIIiVkkjGL73WFQxQo/vDP+3xAVumvExFjFMrdE\nU2yKUV3qP6Xu3491GSvLqbY5+z2rWWyuBtDAAMeWZpoi534x43HWJ32nc+sQ0gW+\nGhRTvuFTg5mLHj0+hNi7EW+F5ux8oq9bOOZh7VnbFsuguqR0B7O858HHjt3NNBTv\nNZDJDMLFE8qCrvqEXmXp9QRU2L6Bxkv4tNgM7E3QFurrCu5tgx3HoBeP8EIVmDiG\nkOTNDa68byLmi+kOkq0P0YI9eh4WIimsh0n+IS8MfQKBgQD9My/1qly0Hlw2J3pI\nZFvjpPeHDq9fzs1oTmykCDi6Gw/4ILiAd+dnCBq1cwiAInwc00rBI1EXue1J6ZLW\nTuNWgc+ejsW8xuMmNmGnpz42pp8p39nfSzAyVuxEsZ9isvIwibyGdTPr5k1tfWen\nm6le8jTioFhM5UCElZFZLWMnEwKBgQDvQtc2wyF2bqWhGgL9D3mwSOkHn8BmXjrs\nVO6yJFZwvidj0kubHuWhTf79tky4j5n0f83tJqfF2ZVLd+KlWVJq9Pj87plUhVo8\nz+ttHgNnVMYmUjBgQ01lOUcGswUqWnaTDqFROVs2k3uW6fCXx6tN+IUZ/YUfU1GU\n/jNFYCEWRQKBgQC08ga9JpF3exbk8JN39pigd70ZPIpiCpVKjHkhRGrdvQdNiHyx\n+n5ZaDZGI74YbAyMQQd0PPvv28RTBOQV2Wyn3r70Dg4L2YptPYHOYTuZrLukHkBC\nTiZUY0AX22QPEdj4jQY4hLulQwFkVLFl211P6AGZT4Oq+E6CMa0csM3iFwKBgQC+\np5WVNrKwjAUBtheRjcZbOg4vHBaVvBrZ/efjHl+fIXeD7KyApIM5IUzC4YSLQSre\nEQWIJ1hjqTl1VMfPGLk7L5BFBOA74LOCZ/BjGBqAOaZYHQAdhSPkOFsntHm2QTXh\ngzP65GiRub4vCKXGXL5duF5f0oxE5QDKaDF04+AZvQKBgQCEzCoAHM8OdYaNn05i\nj8OK9os1zmwoCOwYIIdLEgVTsEx1iwbdXEkQLyeNe3r2w0QOs47LSpbHeO0ajWVm\nI/eQXqCbgBqFgJCB3HY9/rntElveJGHIGe0lDjQr63SGq9JF+tcVkV9v6vYTA6Ee\nAv0Ing2TrsUKByn5fz+7dz0fnQ==\n-----END PRIVATE KEY-----\n",
        "client_email": "firebase-adminsdk-2eahd@tecdelicias-difusion.iam.gserviceaccount.com",
        "client_id": "117254488727622505174",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-2eahd%40tecdelicias-difusion.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      };

      List<String> scopes = [
        "https://www.googleapis.com/auth/firebase.database",
        "https://www.googleapis.com/auth/firebase.messaging",
        "https://www.googleapis.com/auth/cloud-platform"
      ];


      http.Client client = await auths.clientViaServiceAccount(
        auths.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      auths.AccessCredentials credentials = await auths
          .obtainAccessCredentialsViaServiceAccount(
          auths.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes,
          client
      );
      client.close();
      return credentials.accessToken.data;
    }catch (e){
      print(e);

      return Exception(e).toString();
    }
  }

  Future<void> sendMessage(
      String to,
      Map<String, dynamic> data,
      String title,
      String body
      ) async {
    final accessToken = await getAccessToken();
    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/v1/projects/citycaap-ios/messages:send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'message': {
            'token': to,  // Token del dispositivo
            'notification': {
              'title': title,
              'body': body,
            },
            'android': {
              'priority': 'high',
              'ttl': '300s',
              'notification': {
                'sound': 'ringtone',  // Nombre del archivo de sonido para Android (sin extensión)
              },
            },
            'apns': {
              'payload': {
                'aps': {
                  'sound': 'ringtone.aiff',  // Nombre del archivo de sonido para iOS (con extensión)
                },
              },
            },
            'data': data,  // Datos personalizados
          },
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }



}
