import 'package:CapTus/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  late CollectionReference _reference;
  UserProvider() {
    _reference = FirebaseFirestore.instance.collection('Users');
  }

  Future<void> create(UserModel user) async {
    try {
      await _reference.doc(user.id).set(user.toJson());
    } catch (error) {
      String errorMessage = '';
      if (error is FirebaseAuthException) {
        errorMessage = error.code;
      } else {
        errorMessage = 'Unknown error occurred.';
      }
      throw errorMessage;
    }
  }

  Stream<DocumentSnapshot> getByIdStream(String id) {
    return _reference.doc(id).snapshots(includeMetadataChanges: true);
  }

  Future<UserModel?> getById(String id) async {
    DocumentSnapshot documento = await _reference.doc(id).get();
    if (documento.exists) {
      Map<String, dynamic>? data = documento.data() as Map<String, dynamic>?;
      if (data != null) {
        return UserModel.fromJson(data);
      }
    }
    return null;
  }

  Future<void> update(Map<String, dynamic> data, String id) {
    return _reference.doc(id).update(data);
  }
}
