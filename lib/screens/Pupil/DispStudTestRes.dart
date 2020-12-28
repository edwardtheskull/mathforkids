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
                color: setTheme.primaryTextTheme.headline6.color
            ),
          ),
          centerTitle: true,
          backgroundColor: setTheme.primaryColor
        ),
        body: MyDynamicList()
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
                leading: tests[index].blabla(tests[index].passed),
                title: Text(tests[index].name, style: TextStyle(
                    color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize)),
                subtitle: Text(tests[index].date, style: TextStyle(
                    color: setTheme.accentColor, fontSize: SizeConfig.XSMiniTextFontSize)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        child: Text(
                          "More info",
                          style: TextStyle(
                              color: setTheme.accentColor, fontSize: SizeConfig.MiniTextFontSize),
                        ),
                        onTap: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState()));}),
                  ],
                )
            )
          );
        },
      );
    }
  }

}
