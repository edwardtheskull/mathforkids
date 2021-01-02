import 'package:mathforkids/utils/Imports.dart';

class Class extends StatefulWidget {
  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {

  List<String> Students = ["Casper", "Gabriel", "Oskar", "Rasmus", "Tim", "Viktor"];


  String header = "Class";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setTheme.scaffoldBackgroundColor,
      appBar: AppBar(
          toolbarHeight: SizeConfig.AppBarSize,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            iconSize: SizeConfig.SmallIconSize,
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new studentPageState())),
          ),
          iconTheme: IconThemeData(color:setTheme.accentColor),
          backgroundColor: setTheme.primaryColor,
          title: Text(
            header,
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
                color: setTheme.accentColor
            ),
          ),
          centerTitle:true,
          actions: <Widget>[
            PopupMenuButton<String>(
              color: setTheme.primaryColor,
              onSelected: (choice){
                if(choice == Constants.Logout)
                {
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new MyStatefulWidget()));
                }
                else if(choice == Constants.ChangeTheme)
                {
                  setState(() {
                    switchTheme();
                  });
                }
              },
              itemBuilder: (BuildContext context){
                return Constants.choices.map((choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(color: setTheme.accentColor)),
                  );
                }).toList();
              },
            ),
          ]
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
