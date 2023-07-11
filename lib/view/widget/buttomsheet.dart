import 'package:flutter/material.dart';

class CustomBS extends StatelessWidget {
  const CustomBS({
    super.key,
  });

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
                        title: Text('Admin A'),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Untuk membelu kopi kantor'),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text('2-05-2023'),
                        dense: true,
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Rp. 250.000.00-'),
                        dense: true,
                      ),
                      Divider(),
                    ],
                  ),
                ),
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
                  child: Text('Admin A'),
                ),
              ))
        ]);
  }
}