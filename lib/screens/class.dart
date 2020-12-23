import 'package:mathforkids/utils/Imports.dart';

class Class extends StatefulWidget {
  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {

  List<String> Students = ["Casper", "Gabriel", "Oskar", "Rasmus", "Tim", "Viktor"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 69, 82, 1),
      appBar: AppBar(
        centerTitle:true,
        backgroundColor: Colors.green[600],
        title: Text("Class",
        style: TextStyle(
          fontSize: SizeConfig.AppbarFontSize,
          color: Colors.white,
          fontFamily: "Architect",
          fontWeight: FontWeight.bold,),
      ),
    ),
      body: ListView.builder(
        itemCount: Students.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              color: Color.fromRGBO(31, 69, 82, 0.5),
              child: ListTile(
                onTap: () {
                  print(Students[index]);
                },
                title: Text(Students[index], style: TextStyle(color: Colors.white),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/no-profile-picture.png'),
                ),
              ),
            ),
          );
        },

      ),


    );
  }
}
