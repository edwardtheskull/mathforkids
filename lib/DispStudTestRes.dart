import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathforkids/SizeConfig.dart';
import 'specTestResult.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children:
          [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your most recent quiz", style: TextStyle(
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
                        Icons.add_circle,
                        color: Colors.green,
                        size: SizeConfig.SmallIconSize,
                      ),
                      title: Text('Addition diagnos 2',
                          style: TextStyle(color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                      subtitle: Text(
                          '2020-12-12', style: TextStyle(color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             InkWell(
                                 child: Text(
                                   "More info",
                                   style: TextStyle(
                                       color: Colors.green, fontSize: SizeConfig.MiniTextFontSize),
                                 ),
                                  onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context) => new specTestResultState()));
                                  },
                             )],
                         ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0) ,
              child: Text("Earlier Quizzes", style: TextStyle(
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
                            Icons.calculate_rounded,
                            color: Colors.green,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Mixed test', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
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
                                    onTap: () {}),
                              ],
                            ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.remove_circle,
                            color: Colors.green,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Subtraktion diagnos 1', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize )),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.XSMiniTextFontSize)),
                        ),
                         ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: SizeConfig.SmallIconSize,
                          ),
                          title: Text('Addition diagnos 1', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
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
                                     onTap: () {}),
                               ],
                             )
                        ),
                        ListTile(
                          leading:
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('/',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  background: Paint()
                                    ..strokeWidth = 25
                                    ..color = Colors.green
                                    ..style = PaintingStyle.stroke
                                    ..strokeJoin = StrokeJoin.round),
                            ),
                          ),

                          title: Text('Division diagnos 1', style: TextStyle(
                              color: Colors.white, fontSize: SizeConfig.MiniTextFontSize)),
                          subtitle: Text('2020-12-12', style: TextStyle(
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


