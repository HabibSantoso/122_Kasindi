import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kasindi/model/model_user.dart';

class ControllerUser {
  final userColection = FirebaseFirestore.instance.collection('Users');

  final auth = FirebaseAuth.instance;

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future getUser() async {
    final user = await userColection.get();
    streamController.sink.add(user.docs);
    return user.docs;
  }

  Future<void> deleteUser(String id) async {
    await userColection.doc(id).delete();
  }

  Future<void> singOut() async {
    await auth.signOut();
  }

  // ModelUser? getCurrentUser() {
  //   final User? user = auth.currentUser;
  //   if (user != null) {
  //     return ModelUser.fromJson(user);
  //   }
  //   return null;
  // }

  Future<ModelUser?> singInWithEmailandPassworrd(
      String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot snapshot =
            await userColection.doc(user.uid).get();

        final ModelUser currentUser = ModelUser(
          id: user.uid,
          email: user.email ?? '',
          name: snapshot['name'] ?? '',
          phone: snapshot['phone'] ?? '',
          role: snapshot['role'] ?? '',
          is_admin: snapshot['is_admin'] ?? false,
        );

        return currentUser;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<ModelUser?> regiterWithEmailandPassworrd(String email, String password,
      String name, String phone, String role) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        // final DocumentSnapshot snapshot =
        //     await userColection.doc(user.uid).get();

        final ModelUser newUser = ModelUser(
          id: user.uid,
          email: user.email ?? '',
          name: name,
          phone: phone,
          role: role,
          is_admin: false,
        );

        await userColection.doc(newUser.id).set(newUser.toMap());

        return newUser;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return null;
  }
}
