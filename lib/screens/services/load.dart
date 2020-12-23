import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(31, 69, 82, 1),
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.green[600],
          size: 50.0,
        ),
      ),
    );
  }
}