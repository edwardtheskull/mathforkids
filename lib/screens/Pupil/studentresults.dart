import 'package:mathforkids/utils/Imports.dart';


class studentresultPageState extends StatefulWidget {
  @override
  studentresultPage createState() => studentresultPage();
}

class studentresultPage extends State<studentresultPageState> {
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
                    child: Text(choice),
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

          children:
          [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Most recent quiz", style: TextStyle(
                fontSize: SizeConfig.TextFontSize,
                fontFamily: "Architect",
                backgroundColor: setTheme.primaryColor,
                color: setTheme.accentColor),),
          ),
            SingleChildScrollView(
              child: Container( width: SizeConfig.screenWidth, height: SizeConfig.SmallWindowHeight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: setTheme.scaffoldBackgroundColor,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       ListTile(
                        leading: Icon(
                          Icons.add_circle,
                          color: setTheme.buttonColor,
                          size: SizeConfig.SmallIconSize,
                        ),
                        title: Text('Addition',
                            style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                        subtitle: Text(
                            '2020-12-12', style: TextStyle(color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Previous quizzes", style: TextStyle(
                  fontSize: SizeConfig.TextFontSize,
                  fontFamily: "Architect",
                  backgroundColor: setTheme.buttonColor,
                  color: setTheme.accentColor),
              ),
            ),
            Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: setTheme.scaffoldBackgroundColor,
                  elevation: 10,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.calculate_rounded,
                            color: setTheme.buttonColor,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Blandat', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                        ),
                        ListTile(
                         leading: Icon(
                           Icons.remove_circle,
                           color: setTheme.buttonColor,
                           size: SizeConfig.SmallIconSize,
                         ),
                          title: Text('Subtraktion', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: setTheme.buttonColor,
                            size: 40,
                          ),
                          title: Text('addition', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                        ),
                         ListTile(
                          leading:
                          Padding(
                            padding: const EdgeInsets.only(left:16.0),
                            child: Text('/',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  background: Paint()
                                    ..strokeWidth = 25
                                    ..color = setTheme.buttonColor
                                    ..style = PaintingStyle.stroke
                                    ..strokeJoin = StrokeJoin.round),
                            ),
                          ),

                          title: Text('Division', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                        ),
                      ]
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}






