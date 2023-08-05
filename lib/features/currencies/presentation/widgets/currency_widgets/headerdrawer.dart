import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.459,
      width: MediaQuery.of(context).size.width,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor:Color.fromRGBO(44, 52, 90, 1),
              radius: 80.0,
              child:
                  Image.asset('assets/images/icons8-currency-exchange-100.png'),
            ),
            Text(
              'G&C',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 23.0),
            )
          ],
        ),
        decoration:
            BoxDecoration(color: Color.fromRGBO(44, 52, 90, 1),boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 0),
            blurRadius: 3.0,
          ),
        ]),
      ),
    );
  }
}
