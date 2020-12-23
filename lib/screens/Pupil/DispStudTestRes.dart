import 'package:mathforkids/screens/Pupil/data.dart';
import 'package:mathforkids/screens/Pupil/testInfo.dart';
import 'package:mathforkids/utils/Imports.dart';
import 'specTestResult.dart';
import 'package:mathforkids/screens/Pupil/data.dart';

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

    //final tests = ['addition 1', 'subtraction 1', 'multiplication 1', 'division 1'];

    return ListView.builder(
      itemCount: tests.length,

      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){},
            title: Text(tests[index].name),

          ),
        );
      },
    );

  }

}
