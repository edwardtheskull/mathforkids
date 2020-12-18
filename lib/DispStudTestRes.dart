import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathforkids/SizeConfig.dart';

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
            fontSize: 30,
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
            child: Text("Ditt senaste quiz", style: TextStyle(
                fontSize: 22,
                fontFamily: "Architect",
                backgroundColor: Colors.green[600],
                color: Colors.white),),
          ),
            Container(
              width: 400,
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
                        size: 40,
                      ),
                      title: Text('Addition diagnos 2',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text(
                          '2020-12-12', style: TextStyle(color: Colors.white)),
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             InkWell(
                                 child: Text(
                                   "Mer info",
                                   style: TextStyle(
                                       color: Colors.green, fontSize: 20),
                                 ),
                                 onTap: () {}),
                           ],
                         ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0) ,
              child: Text("Tidigare quizzar", style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Architect",
                  backgroundColor: Colors.green[600],
                  color: Colors.white),
              ),
            ),
            Container(
              width: 400,
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
                            size: 40,
                          ),
                          title: Text('Blandat test', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Mer info",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                    ),
                                    onTap: () {}),
                              ],
                            ),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.remove_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: Text('Subtraktion diagnos 1', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                        ),
                         ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: Text('Addition diagnos 1', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                             trailing: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 InkWell(
                                     child: Text(
                                       "Mer info",
                                       style: TextStyle(
                                           color: Colors.green, fontSize: 20),
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
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    child: Text(
                                      "Mer info",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
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


