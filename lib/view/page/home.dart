import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kasindi/controller/controller_transaksi.dart';
import 'package:kasindi/view/page/input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var cTrans = ControllerTrans();

  @override
  void initState() {
    // TODO: implement initState
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
        title: Text(""),
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
                                      color: Colors.grey[350])),
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
                                      builder: (context) => SizedBox()),
                                      child: Container(),
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
              context, MaterialPageRoute(builder: (context) => Input()));
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.auto_graph)),
              IconButton(
                  onPressed: () {
                    // logOut();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
        ),
      ),
    );
  }
}
