import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'file:///C:/Users/Gabriel/AndroidStudioProjects/mathforkids/lib/utils/ChangeTheme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: setTheme.scaffoldBackgroundColor,
      child: Center(
        child: SpinKitFadingCircle(
          color: setTheme.primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}