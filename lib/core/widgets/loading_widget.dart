import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CupertinoActivityIndicator(
              color: Color.fromRGBO(35, 41, 70, 1),
          radius: 20.0,
        ),
      ),
    );
  }
}
