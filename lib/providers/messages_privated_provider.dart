
import 'package:CapTus/models/user.dart';
import 'package:CapTus/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message_privated.dart';

class MessagesprivatedProvider {
  late CollectionReference _ref;

  MessagesprivatedProvider() {
    _ref = FirebaseFirestore.instance.collection('MessagesPrivated');
  }

  Future<String> create(Messagesprivated messagesprivated) async {
    try {
      String id = _ref.doc().id;
      messagesprivated.id = id;

      await _ref.doc(messagesprivated.id).set(messagesprivated.toJson());
      return id;
    } catch (error) {
      throw error.toString();
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getByIdStream(String id) {
    return _ref
        .doc(id)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) => snapshot as DocumentSnapshot<Map<String, dynamic>>);
  }

  Future<Messagesprivated?> getById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await _ref.doc(id).get() as DocumentSnapshot<Map<String, dynamic>>;

    if (document.exists) {
      Messagesprivated messages = Messagesprivated.fromJson(document.data()!);
      return messages;
    }

    return null;
  }

  Future<void> update(Map<String, dynamic> data, String id) {
    return _ref.doc(id).update(data);
  }

  Future<void> delete(String id) {
    return _ref.doc(id).delete();
  }

  Future<List<Messagesprivated>> getByIdClient(String id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _ref
        .where('iduser', isEqualTo: id)
        .orderBy('timestamp', descending: true)
        .get() as QuerySnapshot<Map<String, dynamic>>;

    List<Map<String, dynamic>> allData =
    querySnapshot.docs.map((doc) => doc.data()).toList();

    List<Messagesprivated> messagesprivatedList = [];

    for (Map<String, dynamic> data in allData) {
      messagesprivatedList.add(Messagesprivated.fromJson(data));
    }

    for (Messagesprivated messagesprivated in messagesprivatedList) {
      UserProvider userProvider = UserProvider();
      UserModel? user = await userProvider.getById(messagesprivated.id);
      if (user != null) {
        user.username = user.username;
      }
    }

    return messagesprivatedList;
  }
}
