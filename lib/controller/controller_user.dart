import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControllerUser {
  final userColection = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;
  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();
  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future getUser() async {
    final user = await userColection.get();
    streamController.sink.add(user.docs);
    return user.docs;
  }

  Future deleteUser(String id) async {
    final user = await userColection.doc(id).delete();
    return user;
  }
}
