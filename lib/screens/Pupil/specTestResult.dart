import 'package:mathforkids/utils/Temp.dart';
import 'package:mathforkids/utils/Imports.dart';

class specTestResultState extends StatefulWidget {
  final String quizzId;
  specTestResultState({Key key, @required this.quizzId,}) : super(key: key);
  @override
  specTestPage createState() => specTestPage(quizzId);
}

class specTestPage extends State<specTestResultState> {
  String quizzId;
  specTestPage(this.quizzId);
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
                    child: Text((GlobQL[quizzId] != null) ? GlobQL[quizzId]['Name'].toString() : 'QuizzName', style: TextStyle(
                        fontSize: SizeConfig.HeaderTextFontSize,
                        fontFamily: "Architect", fontWeight: FontWeight.bold,
                        color: setTheme.accentColor),),
                  ),
                ),
                Container(height: SizeConfig.SpecTestScreenHeight,
                  child: MyDynamicList(context),
                ),
              ],
            )
        ),
    );
  }
  Widget MyDynamicList(BuildContext context){
    if (GlobQL['Questions'] != null && GlobQL['Questions'].length > 0) {
      return ListView.builder(
        itemCount: GlobQL['Questions'].length,
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
                child: Container(
                  child: Card(
                      color: setTheme.scaffoldBackgroundColor,
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: (GlobQL['Specifics']['Q'+(index+1).toString()] == 'true') ? Colors.green : Colors.red,
                          ),
                          title: Text(GlobQL['Questions']['Q'+(index+1).toString()], style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                      )
                  ),
                ),
                /*onTap: () {showDialog(
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
                    });}*/
            ),
          );
        },
      );
    }
  }
}