import 'package:mathforkids/screens/Pupil/data.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/utils/Imports.dart';

class specTestResultState extends StatefulWidget {
  final TestInfo tests;
  specTestResultState({Key key, @required this.tests,}) : super(key: key);

  @override
  specTestPage createState() => specTestPage(tests);

}

class specTestPage extends State<specTestResultState> {
  TestInfo tests;
  specTestPage(this.tests);
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
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new DispStudTestResState())),
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
                    child: Text("${tests.testName}", style: TextStyle(
                        fontSize: SizeConfig.HeaderTextFontSize,
                        fontFamily: "Architect", fontWeight: FontWeight.bold,
                        color: setTheme.accentColor),),
                  ),
                ),
                Container(height: SizeConfig.SpecTestScreenHeight,
                  child: MyDynamicList(),
                ),
              ],
            )
        ),
    );
  }
}
class MyDynamicList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (questions.length > 0) {
      return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
              child: Container(
                  child: Card(
                      color: setTheme.scaffoldBackgroundColor,

                      child: ListTile(
                          hoverColor: Colors.blue,
                          leading: questions[index].whatIcon(questions[index].stdAnswer),
                          title: Text(questions[index].name, style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text("${questions[index].qst}=${questions[index].stdAnswer}", style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  child: Text(
                                    questions[index].trailer,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                  ),
                                  ),
                            ],
                          )
                      )
                  ),
                ),
                onTap: () {showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text(questions[index].qst),
                        content: Text("Your answer: ${questions[index].qst}= ${questions[index].stdAnswer}\n"
                            "Right Answer: ${questions[index].qst}= ${questions[index].answer}"),
                        actions: [
                          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("close"))
                        ],
                      );
                    });}
              ),
            );
        },
      );
    }
  }
}

