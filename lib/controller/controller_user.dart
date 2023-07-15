import 'package:cloud_firestore/cloud_firestore.dart';

class ControllerUser {
  final userColection = FirebaseFirestore.instance.collection('Users');
  
}
