import 'package:mathforkids/utils/Imports.dart';

class Home extends StatelessWidget{
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Mathforkids'),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}