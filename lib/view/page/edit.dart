import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:kasindi/controller/controller_transaksi.dart';
import 'package:kasindi/model/model_transaksi.dart';
import 'package:kasindi/view/page/home.dart';

class Edit extends StatefulWidget {
  Edit({
    Key? key,
    required this.documentstate,
  }) : super(key: key);

  final DocumentSnapshot<Object?> documentstate;

  @override
  State<Edit> createState() => _EditState();
}

const dummyidlist = <String>['123', '124', '125', '126', '127'];
List<String> jenisTrans = ['Pemasukan', 'Pengeluaran'];

class _EditState extends State<Edit> {
  String? _idref = "";
  String? _iduser = "";
  final _userPJ = TextEditingController();
  final _nominal = TextEditingController();
  final _dateinput = TextEditingController();
  final _keterangan = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _idref = widget.documentstate['id_ref'].toString();
    _userPJ.text = widget.documentstate['id_user'].toString();
    _nominal.text = widget.documentstate['nominal'].toString();
    _dateinput.text = widget.documentstate['tanggal'].toString();
    _keterangan.text = widget.documentstate['keterangan'].toString();
    super.initState();
  }

  ControllerTrans cTrans = new ControllerTrans();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF5CC2F2),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            //height: 700,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButtonFormField(
                      value: widget.documentstate['id_ref'].toString() ?? "",
                      items: jenisTrans.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _idref = val;
                        });
                      },
                      // onSaved: (val) {
                      //   _idref = val;
                      // },
                      decoration: InputDecoration(
                        labelText: 'ID Ref',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      )),
                  // DropdownButtonFormField(
                  //     value: widget.documentstate['id_user'].toString() ?? "",
                  //     items: dummyidlist.map((e) {
                  //       return DropdownMenuItem(
                  //         child: Text(e),
                  //         value: e,
                  //       );
                  //     }).toList(),
                  //     onChanged: (String? val) {
                  //       setState(() {
                  //         _iduser = val;
                  //       });
                  //     },
                  //     decoration: InputDecoration(
                  //       labelText: 'ID Akun',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(50)),
                  //     )),
                  TextFormField(
                    controller: _userPJ,
                    decoration: InputDecoration(
                        labelText: 'Akun Penanggung Jawab',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    enabled: false,
                  ),
                  TextFormField(
                    //initialValue: widget.documentstate["nominal"].toString()!,
                    controller: _nominal,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Nominal',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        prefixText: 'Rp. ',
                        suffixText: 'IDR',
                        suffixStyle: TextStyle(color: Colors.green)),
                    // onChanged: (val) {
                    //   _nominal.text = val;
                    // },
                  ),
                  TextFormField(
                    //initialValue: widget.documentstate['tanggal'].toString(),
                    controller: _dateinput,
                    decoration: InputDecoration(
                      labelText: 'Tanggal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030));

                      if (pickedDate != null) {
                        setState(() {
                          _dateinput.text =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                        });
                      }
                    },
                    // onSaved: (val) {
                    //   _dateinput.text = val!;
                    // },
                  ),
                  TextFormField(
                    //initialValue: widget.documentstate['keterangan'].toString(),
                    controller: _keterangan,
                    decoration: InputDecoration(
                        labelText: 'Keterangan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    maxLines: 3,
                    // onFieldSubmitted: (val) {
                    //   _keterangan.text = val!;
                    // },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 5, horizontal: 10),
                      //   child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //           fixedSize: Size(double.maxFinite, 40),
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(30))),
                      //       child: Text('FOTO BUKTI KETERANGAN',
                      //           style: TextStyle(
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold))),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: Text(
                                'BATAL',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final mdTrans = ModelTransaksi(
                                    id: widget.documentstate['id'],
                                    id_ref: _idref!,
                                    id_user: _userPJ.text,
                                    nominal: int.parse(_nominal.text),
                                    tanggal: _dateinput.text,
                                    keterangan: _keterangan.text);

                                cTrans.editTrans(mdTrans);

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: Text(
                                'SIMPAN',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
