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
        backgroundColor: Color.fromRGBO(31, 69, 82, 1),
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: SizeConfig.AppbarFontSize,
              fontFamily: "Architect",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[600],
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
            color: Color.fromRGBO(31, 69, 82, 1),

            child: ListTile(
                hoverColor: Colors.blue,
                leading: tests[index].blabla(tests[index].passed),
                title: Text(tests[index].name, style: TextStyle(
                    color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                subtitle: Text(tests[index].date, style: TextStyle(
                    color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        child: Text(
                          "More info",
                          style: TextStyle(
                              color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
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
