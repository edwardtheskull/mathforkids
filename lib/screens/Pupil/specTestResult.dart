import 'package:mathforkids/screens/Pupil/data.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/utils/Imports.dart';

class specTestResultState extends StatefulWidget {
  final TestInfo test;

  specTestResultState({Key key, @required this.test}) : super(key: key);

  @override
  specTestPage createState() => specTestPage();
}

class specTestPage extends State<specTestResultState> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: setTheme.scaffoldBackgroundColor,
        appBar: AppBar(
            title: Text(
              "Math for Kids",
              style: TextStyle(
                  fontSize: SizeConfig.AppbarFontSize,
                  fontFamily: "Architect",
                  fontWeight: FontWeight.bold,
                  color: setTheme.primaryTextTheme.headline6.color),
            ),
            centerTitle: true,
            backgroundColor: setTheme.primaryColor),
        body: MyDynamicList());
  }
}
class MyDynamicList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (questions.length > 0) {
      return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
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

                              });}),
                    ],
                  )
              )
          );
        },
      );
    }
  }
}