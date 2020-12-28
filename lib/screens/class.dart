import 'package:mathforkids/utils/Imports.dart';

class Class extends StatefulWidget {
  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {

  List<String> Students = ["Casper", "Gabriel", "Oskar", "Rasmus", "Tim", "Viktor"];



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: setTheme.accentColor),
        centerTitle:true,
        backgroundColor: setTheme.primaryColor,
        title: Text("Class",
        style: TextStyle(
          fontSize: SizeConfig.AppbarFontSize,
          color: setTheme.primaryTextTheme.headline6.color,
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
                title: Text(Students[index], style: TextStyle(color: setTheme.accentColor),),
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
