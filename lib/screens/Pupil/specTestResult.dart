import 'package:mathforkids/utils/Imports.dart';


class specTestResultState extends StatefulWidget {
  @override
  specTestPage createState() => specTestPage();
}

class specTestPage extends State<specTestResultState> {
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
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children:
          [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Addition diagnos 2", style: TextStyle(
                fontSize: SizeConfig.HeaderTextFontSize,
                fontFamily: "Architect",
                backgroundColor: Colors.green[600],
                color: Colors.white),),
          ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromRGBO(31, 69, 82, 1),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: SizeConfig.SmallIconSize,
                      ),
                      title: Text('Test Passed',
                          style: TextStyle(color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                      subtitle: Text(
                          '2020-12-12', style: TextStyle(color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            child: Text(
                              "15/16",
                              style: TextStyle(
                                  color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                            ),
                            onTap: (){},
                          )],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0) ,
              child: Text("Question by question", style: TextStyle(
                  fontSize: SizeConfig.HeaderTextFontSize,
                  fontFamily: "Architect",
                  backgroundColor: Colors.green[600],
                  color: Colors.white),
              ),
            ),
            Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromRGBO(31, 69, 82, 1),
                  elevation: 10,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Question 1', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('1+1=2', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  child: Text(
                                    "passed",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                  ),
                                  onTap: () {}),
                            ],
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.error,
                            color: Colors.green,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Question 2', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize )),
                          subtitle: Text('2+2=5', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "view error",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                    ),
                                    onTap: () {
                                      showDialog(context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text("Question 2"),
                                          content: Text("Your answer: 2+2=5\nRight answer: 2+2=4"),
                                          actions: [
                                            FlatButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: Text("close"))
                                          ],
                                        );
                                      });
                                    }),
                              ],
                            )
                        ),
                        ListTile(
                            leading: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: SizeConfig.SmallIconSize,
                            ),
                            title: Text('Question 3', style: TextStyle(
                                color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                            subtitle: Text('5+5=10', style: TextStyle(
                                color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "passed",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                    ),
                                    onTap: () {}),
                              ],
                            )
                        ),
                        ListTile(
                            leading: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: SizeConfig.SmallIconSize,
                            ),

                            title: Text('Question 4', style: TextStyle(
                                color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                            subtitle: Text('15+16=31', style: TextStyle(
                                color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "passed",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                    ),
                                    onTap: () {}),
                              ],
                            )
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