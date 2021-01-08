import 'package:mathforkids/screens/Pupil/takeQuiz.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';

class learnQPageState extends StatefulWidget {
  String type;
  learnQPageState({Key key, @required this.type}) : super(key: key);
  @override
  LearnQPage createState() => LearnQPage(type);
}

class LearnQPage extends State<learnQPageState> {
  String type;
  LearnQPage(this.type);
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
              onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new learnPageState())),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Advance your knowledge", style: TextStyle(fontFamily: 'Architect', fontSize: SizeConfig.SmallTextFontSize, color: setTheme.accentColor),),
            ),
            Container(
              child: learnQuizzes(context),
            ),
          ],
        ),
        );
  }
  Widget learnQuizzes(BuildContext context){
    if (GlobQL['Quizzes'] != null) {
      return ListView.builder( shrinkWrap: true,
          itemCount: GlobQL['Quizzes'].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                color: setTheme.cardColor,
                child: ListTile(
                  onTap: () async {
                    await DatabaseService().buildQuizFromDb('quizzes/'+type+'/'+GlobQL['Quizzes'].keys.toList()[index]);
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new takeQuizPageState()));
                  },
                  leading: Icon(Icons.analytics, color: setTheme.primaryColor, size: SizeConfig.SmallIconSize,),
                  title: Text(GlobQL['Quizzes'].values.toList()[index], style: TextStyle(fontSize: SizeConfig.TextFontSize, color: setTheme.accentColor, fontFamily: 'Architect'),),
                ),
              ),
            );
          }
      );
    }
  }
}
