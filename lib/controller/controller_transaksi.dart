import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasindi/model/model_transaksi.dart';

class ControllerTrans {
  final transaksicolltion = FirebaseFirestore.instance.collection('transaksi');
  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();
  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  Future<void> addTransaksi(ModelTransaksi mdTrans) async {
    final transaksi = mdTrans.toMap();
    final DocumentReference docref = await transaksicolltion.add(transaksi);
    final String docid = docref.id;
    final modelTransaksi = ModelTransaksi(
        id: docid,
        id_ref: mdTrans.id_ref,
        id_user: mdTrans.id_user,
        nominal: mdTrans.nominal,
        tanggal: mdTrans.tanggal,
        keterangan: mdTrans.keterangan);

    await docref.update(modelTransaksi.toMap());
  }

  Future<List> getTrans() async {
    final transaksi = await transaksicolltion.get();
    streamController.sink.add(transaksi.docs);
    return transaksi.docs;
  }
}
