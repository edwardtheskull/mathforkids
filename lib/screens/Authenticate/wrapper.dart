import 'package:flutter/material.dart';
import 'package:mathforkids/main.dart';
import 'package:mathforkids/screens/Authenticate/authenticate.dart';
import 'package:mathforkids/screens/Authenticate/home.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    } else {
      return MyStatefulWidget();
    }
  }
}