import 'package:mathforkids/main.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Authenticate/user.dart';


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