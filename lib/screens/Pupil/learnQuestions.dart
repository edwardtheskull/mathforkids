import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Teacher/Temp.dart';

class learnQPageState extends StatefulWidget {
  @override
  LearnQPage createState() => LearnQPage();
}

class LearnQPage extends State<learnQPageState> {
  @override
  Map<String, String> map;
  String header = "Math for Kids";
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    map = { "10037":"Quiz 1", "10042":"Quiz 2", "10069":"Horryyy SHitt mann, skön quiz!"};
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
              child: Text("Tests you want to take!!!", style: TextStyle(fontFamily: 'Architect', fontSize: SizeConfig.SmallTextFontSize, color: setTheme.accentColor),),
            ),
            ListView.builder( shrinkWrap: true,
                itemCount: map.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      color: Color.fromRGBO(31, 69, 82, 0.5),
                      child: ListTile(
                        onTap: () {
                          print(map.keys.toList()[index]);
                        },
                        leading: Icon(Icons.analytics, color: setTheme.primaryColor),
                        title: Text(map.values.toList()[index], style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect'),),
                        trailing: Text("Difficulty ", style: TextStyle(color: setTheme.accentColor, fontFamily: 'Architect'),),
                      ),
                  ),
                );
                }
            ),
          ],
        ),

        );



    /*Container(
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Addition",
                      style: TextStyle(
                          fontSize: SizeConfig.MiniTextFontSize,
                          color: setTheme.accentColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Architect'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: setTheme.scaffoldBackgroundColor,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: setTheme.buttonColor,
                              size: SizeConfig.SmallIconSize,
                            ),
                            title: Text('Addition',
                                style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize, fontFamily: "Architect")),
                            subtitle: Text('Easy',
                                style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize, fontFamily: "Architect")),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Take quiz",
                                      style: TextStyle(
                                          color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize, fontFamily: "Architect"),
                                    ),
                                    onTap: () {}),
                              ],
                            )),
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: setTheme.scaffoldBackgroundColor,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: setTheme.buttonColor,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Addition',
                              style: TextStyle(color: setTheme.accentColor, fontSize:  SizeConfig.MiniTextFontSize, fontFamily: "Architect")),
                          subtitle: Text('Intermediate',
                              style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize, fontFamily: "Architect")),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  child: Text(
                                    "Take quiz",
                                    style: TextStyle(
                                        color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize, fontFamily: "Architect"),
                                  ),
                                  onTap: () {}),
                            ],
                          ),
                        ),
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: setTheme.scaffoldBackgroundColor,
                      elevation: 10,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        ListTile(
                            leading: Icon(
                              Icons.add_circle,
                              color: setTheme.buttonColor,
                              size: SizeConfig.SmallIconSize,
                            ),
                            title: Text('Addition',
                                style: TextStyle(color: setTheme.accentColor, fontSize:  SizeConfig.MiniTextFontSize, fontFamily: "Architect")),
                            subtitle: Text('Hard',
                                style: TextStyle(color: setTheme.accentColor, fontSize:  SizeConfig.XSMiniTextFontSize, fontFamily: "Architect")),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Take quiz",
                                      style: TextStyle(
                                          color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize, fontFamily: "Architect"),
                                    ),
                                    onTap: () {}),
                              ],
                            )),
                      ])),
                ),
              ),
            ]),
          )),
    );*/
  }
}
