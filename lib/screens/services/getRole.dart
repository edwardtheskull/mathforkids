import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mathforkids/utils/Imports.dart';

class GetRole extends StatelessWidget {
  final String role;

  GetRole(this.role);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = Firestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.document(role).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot>snapshot){
          if (snapshot.hasError){
            return Text("error");
          }

          if (snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data.data;
            return Text("${data['role']}");
          }
          return Text("loading");
        },
    );
  }
}