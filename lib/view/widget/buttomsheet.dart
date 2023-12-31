import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kasindi/view/page/edit.dart';

import 'package:kasindi/view/page/home.dart';

import '../../controller/controller_transaksi.dart';

class CustomBS extends StatelessWidget {
  //String id;
  DocumentSnapshot<Object?> document;

  CustomBS({
    Key? key,
    //required this.id,
    required this.document,
  }) : super(key: key);

  ControllerTrans cTrans = new ControllerTrans();

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(document['tanggal'].toString()),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text(document['id_ref'].toString()),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text(document['keterangan'].toString()),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text(document['nominal'].toString()),
                        dense: true,
                      ),
                      Divider(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Edit(documentstate: document)));
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            cTrans.deleteTrans(document['id']);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                )
                //Text('test bottom seet')
              ],
            ),
          ),
          Positioned(
              bottom: 320,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  height: 80,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image:
                                      AssetImage('assets/images/kasidi.png'))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(document['id_user']),
                      )
                    ],
                  ),
                ),
              ))
        ]);
  }
}
