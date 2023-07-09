import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasindi/view/page/home.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

const dummyidlist = <String>['123', '124', '125', '126', '127'];
String? _slectedVel = "";

class _InputState extends State<Input> {
  TextEditingController _dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Form Transaksi'),
      // ),
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
                      items: dummyidlist.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _slectedVel = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'ID Ref',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      )),
                  DropdownButtonFormField(
                      items: dummyidlist.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (String? val) {
                        setState(() {
                          _slectedVel = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'ID Akun',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      )),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //       labelText: 'ID Akun', border: OutlineInputBorder()),
                  // ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Nominal',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        prefixText: 'Rp. ',
                        suffixText: 'IDR',
                        suffixStyle: TextStyle(color: Colors.green)),
                  ),
                  TextFormField(
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
                      //     .then((DateTime? value) {
                      //   if (value != null) {
                      //     DateTime _formatDate;
                      //     _formatDate = value;
                      //     String date = DateFormat.yMMMd().format(_formatDate);
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(content: Text('Selected date: $date')));
                      //     setState(() {
                      //       _dateinput.text = date;
                      //     });
                      //   }
                      // });

                      if (pickedDate != null) {
                        setState(() {
                          _dateinput.text =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                        });
                      }
                    },
                    //onChanged: ,
                    //onSaved: ,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Keterangan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    maxLines: 3,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(double.maxFinite, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text('FOTO BUKTI KETERANGAN',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
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
                              onPressed: () {},
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