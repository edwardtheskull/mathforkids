import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';
import 'package:mathforkids/screens/services/database.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'specTestResult.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';

class DispStudTestResState extends StatefulWidget {
  @override
  dispResultPage createState() => dispResultPage();
}

class dispResultPage extends State<DispStudTestResState> {
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
                color: setTheme.accentColor,
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
                      child: Text(choice, style: TextStyle(color: setTheme.accentColor),),
                    );
                  }).toList();
                },
              ),
            ]
        ),
        body: Center(
            child: Container(height:SizeConfig.screenHeight,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                      child: Text("Earlier quizzes", style: TextStyle(
                          fontSize: SizeConfig.HeaderTextFontSize,
                          fontFamily: "Architect", fontWeight: FontWeight.bold,
                          color: setTheme.accentColor),),
                    ),
                  ),
                  Container(height:SizeConfig.HalfScreenHeight,
                      child: MyDynamicList()
                  ),
                ],
              ),
            )
        )
    );
  }
}

class MyDynamicList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (GlobQL.length > 0) {
      return ListView.builder(
        itemCount: GlobQL.length-2,
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
              child: Container(
                child: Card(
                  color: setTheme.scaffoldBackgroundColor,
                  child: ListTile(
                      hoverColor: Colors.blue,
                      leading: CircleAvatar(
                        backgroundColor: (GlobQL.values.toList()[index+2]['Max'] == GlobQL.values.toList()[index+2]['Result']) ? Colors.green : Colors.red,
                      ),
                      title: Text(GlobQL.values.toList()[index+2]['Name'].toString(), style: TextStyle(
                          color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${GlobQL.values.toList()[index+2]['Result']}/${GlobQL.values.toList()[index+2]['Max']}",
                            style: TextStyle(
                                color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                          ),
                        ],
                      )
                  )
                ),
              ),
                onTap: () async{
                await DatabaseService().getQuizResults(GlobQL.values.toList()[index+2]['Code']);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState(quizzId: GlobQL.values.toList()[index+2]['Code'])));
              }),
          );
        },
      );
    }
  }

}
