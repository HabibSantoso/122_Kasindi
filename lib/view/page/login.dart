import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

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
                Container(
                  height: 450,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            onChanged: (val) {
                              // username = val;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: TextFormField(
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
                            onChanged: (val) {
                              // password = val;
                            },
                            onFieldSubmitted: (String value) {},
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                          child: Row(
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
                                  //     (route) => false);
                                  // Navigator.pushAndRemoveUntil(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DashboardPage(), (route) => true));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 370,
                    child: Container(
                      height: 200,
                      width: 200,
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
}