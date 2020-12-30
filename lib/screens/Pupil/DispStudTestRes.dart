import 'package:mathforkids/screens/Pupil/data.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'specTestResult.dart';
import 'package:mathforkids/screens/Pupil/data.dart';
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
            leading: IconButton(icon: Icon(Icons.arrow_back),
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
            child: Column(
              children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                      child: Text("Most Recent quiz", style: TextStyle(
                          fontSize: SizeConfig.HeaderTextFontSize,
                          fontFamily: "Architect",
                          backgroundColor: Colors.green[600],
                          color: Colors.white),),
                    ),
                  ),
                Container(height: SizeConfig.screenHeight/5,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index,){
                      return Card(
                          color: setTheme.scaffoldBackgroundColor,

                          child: ListTile(
                              hoverColor: Colors.blue,
                              leading: tests.last.whatIcon(tests.last.studP),
                              title: Text(tests.last.testName, style: TextStyle(
                                  color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                              subtitle: Text(tests.last.date, style: TextStyle(
                                  color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                      child: Text(
                                        "${tests.last.studP}/${tests.last.maxP}",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                      ),
                                      onTap: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState(tests: tests.last)));}),
                                ],
                              )
                          )
                      );
                    },
                    ),
                ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                      child: Text("earlier quizzes", style: TextStyle(
                        fontSize: SizeConfig.HeaderTextFontSize,
                        fontFamily: "Architect",
                        backgroundColor: Colors.green[600],
                        color: Colors.white),),
                  ),
                ),
                Container(height: SizeConfig.screenHeight,
                    child: MyDynamicList()
                ),
              ],
            )
        )
    );
  }
}

class MyDynamicList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (tests.length > 0) {
      return ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return Card(
            color: setTheme.scaffoldBackgroundColor,

            child: ListTile(
                hoverColor: Colors.blue,
                leading: tests[index].whatIcon(tests[index].studP),
                title: Text(tests[index].testName, style: TextStyle(
                    color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                subtitle: Text(tests[index].date, style: TextStyle(
                    color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        child: Text(
                          "${tests[index].studP}/${tests[index].maxP}",
                          style: TextStyle(
                              color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                        ),
                        onTap: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState(tests: tests[index])));}),
                  ],
                )
            )
          );
        },
      );
    }
  }

}
