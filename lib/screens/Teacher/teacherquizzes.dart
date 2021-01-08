import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';


class teacherQuizzesPageState extends StatefulWidget {
  @override
  teacherQuizzesPage createState() => teacherQuizzesPage();
}

class teacherQuizzesPage extends State<teacherQuizzesPageState> {
  @override
  String header = "Math for Kids";
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setTheme.scaffoldBackgroundColor,
      appBar: AppBar(
          toolbarHeight: SizeConfig.AppBarSize,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            iconSize: SizeConfig.SmallIconSize,
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new teacherPageState())),
          ),
          iconTheme: IconThemeData(color:setTheme.accentColor),
          backgroundColor: setTheme.primaryColor,
          title: Text(
            header,
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
                color:setTheme.accentColor
            ),
          ),
          centerTitle:true,
          actions: <Widget>[
            PopupMenuButton<String>(
              color: setTheme.primaryColor,
              onSelected: (choice){
                if(choice == Constants.Logout)
                {
                  Navigator.pushAndRemoveUntil(context,  new MaterialPageRoute(builder: (context) => new MyStatefulWidget()), (route) => false);
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
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Your quizzes", style: TextStyle(
                    fontSize: SizeConfig.TextFontSize,
                    fontFamily: "Architect",
                    backgroundColor: setTheme.buttonColor,
                    color: setTheme.accentColor),
                ),
              ),
          ),
            Container(height: SizeConfig.TeacherPageHeight,
              child: TeachQuizzList(context),
            ),
          ],
        ),
      ),
    );
  }
  Widget TeachQuizzList(BuildContext context){
    if (GlobQL['Quizzes'] != null) {
      return ListView.builder(
        itemCount: GlobQL['Quizzes'].length,
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
              child: Container(
                child: Card(
                    color: setTheme.scaffoldBackgroundColor,
                    child: ListTile(
                      title: Text(GlobQL['Quizzes'].values.toList()[index], style: TextStyle(
                          color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                      trailing: Text('Code: '+GlobQL['Quizzes'].keys.toList()[index], style: TextStyle(
                          color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                    )
                ),
              ),
            ),
          );
        },
      );
    }
  }
}





