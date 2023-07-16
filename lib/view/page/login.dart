import 'package:flutter/material.dart';
import 'package:kasindi/view/page/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool is_login = true;
  final _nEmail = TextEditingController();
  final _nPass = TextEditingController();
  final _rName = TextEditingController();
  final _rRole = TextEditingController();
  final _rPhone = TextEditingController();
  final _rEmail = TextEditingController();
  final _rPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Kasidi Login Page')),
      body: Container(
        color: Color(0xFF5CC2F2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                tampilan(context),
                Positioned(
                    bottom: is_login ? 370 : 630,
                    child: Container(
                      height: is_login ? 200 : 130,
                      width: is_login ? 200 : 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/kasidi.png'),
                              fit: BoxFit.fitHeight)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton operview() {
    return TextButton(
        onPressed: () {
          setState(() {
            is_login = !is_login;
          });
        },
        child: Text(is_login ? 'Register >' : '< Login'));
  }

  Container tampilan(BuildContext context) {
    return is_login ? loginView(context) : RegisterView(context);
  }

  Container loginView(BuildContext context) {
    return Container(
      height: 450,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _nEmail,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                // onChanged: (val) {
                //   // username = val;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _nPass,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    filled: true,
                    hintText: 'Masukkan Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                // onChanged: (val) {
                //   // password = val;
                // },
                onFieldSubmitted: (String value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // String npassword = password ?? '';
                          // String nusername = username ?? '';
                          // print("ini dia" + nusername + npassword);
                          // loginUser(nusername, npassword);
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             DashboardPage()),
                          //     (route) => false);f
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Home(), (route) => true));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Masuk',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  operview()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container RegisterView(BuildContext context) {
    return Container(
      height: 720,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _rName,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _rRole,
                decoration: InputDecoration(
                  hintText: 'Masukkan Role',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _rPhone,
                decoration: InputDecoration(
                  hintText: 'Masukkan No. HP',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _rEmail,
                decoration: InputDecoration(
                  hintText: 'Masukkan Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: TextFormField(
                controller: _rPass,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    filled: true,
                    hintText: 'Masukkan Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                onFieldSubmitted: (String value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // String npassword = password ?? '';
                          // String nusername = username ?? '';
                          // print("ini dia" + nusername + npassword);
                          // loginUser(nusername, npassword);
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             DashboardPage()),
                          //     (route) => false);f
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Home(), (route) => true));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Masuk',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  operview()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
