import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kasindi/controller/controller_transaksi.dart';
import 'package:kasindi/controller/controller_user.dart';
import 'package:kasindi/model/model_user.dart';
import 'package:kasindi/view/page/input.dart';
import 'package:kasindi/view/widget/buttomsheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var cTrans = ControllerTrans();
  ModelUser? currUser;
  //final User? user = ControllerUser().currentUser;

  @override
  void initState() {
    // TODO: implement initState
    ControllerUser().getCurrentUser().then((value) {
      setState(() {
        currUser = value!;
      });
    });
    cTrans.getTrans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(currUser?.name ?? ''),
        leading: Icon(Icons.account_circle_outlined),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Container(
        color: Color(0xFF5CC2F2),
        //padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: Container(
            //color: Colors.white,
            // padding:
            //     const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(70),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(0xCC191BA9)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 125,
                          left: 0,
                          child: Container(
                            height: 80,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Color(0xE6C1EAF2),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50))),
                          )),
                      Positioned(
                          top: 130,
                          left: 25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Saldo',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blue[350])),
                              Text('Rp. 1.000.000,00-',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[400])),
                            ],
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                      child: StreamBuilder<List<DocumentSnapshot>>(
                        stream: cTrans.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final List<DocumentSnapshot> data = snapshot.data!;

                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(top: 10),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final document = data[index];
                                // final String idf = document['id'].toString();

                                return GestureDetector(
                                  onLongPress: () => showModalBottomSheet(
                                      constraints: BoxConstraints(
                                        maxHeight: 350,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.elliptical(30, 30),
                                              topRight:
                                                  Radius.elliptical(30, 30))),
                                      context: context,
                                      builder: (context) => CustomBS(
                                            // id: idf,
                                            document: document,
                                          )),
                                  child: Card(
                                    color: Color(0xFFF7F3F3),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Container(
                                        width: double.maxFinite,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: //Center(child: Text('Elevated Card')),
                                            Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Container(
                                                height: 55,
                                                width: 55,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fitHeight,
                                                        image: AssetImage(
                                                            'assets/images/kasidi.png'))),
                                              ),
                                            ),
                                            Expanded(
                                              //flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Container(
                                                  height: 80,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(document['id_user']),
                                                      //Text(snapshot.data!.note),
                                                      Text(document['tanggal']),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Container(
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(document['id_ref']),
                                                    Text(
                                                        'Rp. ${document['nominal'].toString()}')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ),
                  // Center(
                  //     child: FloatingActionButton(
                  //         child: const Icon(Icons.add), onPressed: () {}))
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: false,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Input(namePJ: currUser?.name ?? '')));
        },
        child: Icon(
          Icons.add,
          size: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFF5CC2F2),
        elevation: 0.0,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //IconButton(onPressed: () {}, icon: Icon(Icons.auto_graph)),
              IconButton(
                  onPressed: () {
                    ControllerUser().singOut();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
        ),
      ),
    );
  }
}
