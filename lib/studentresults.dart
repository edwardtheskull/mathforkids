import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mathforkids/SizeConfig.dart';


class studentresultPageState extends StatefulWidget {
  @override
  studentresultPage createState() => studentresultPage();
}

class studentresultPage extends State<studentresultPageState> {
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
            child: Text("Most recent quiz", style: TextStyle(
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
                    const ListTile(
                      leading: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 40,
                      ),
                      title: Text('Addition',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      subtitle: Text(
                          '2020-12-12', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Previous quizzes", style: TextStyle(
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
                        const ListTile(
                          leading: Icon(
                            Icons.calculate_rounded,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: Text('Blandat', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                        ),
                       const ListTile(
                         leading: Icon(
                           Icons.remove_circle,
                           color: Colors.green,
                           size: 40,
                         ),
                          title: Text('Subtraktion', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          title: Text('addition', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
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
                                    ..color = Colors.green
                                    ..style = PaintingStyle.stroke
                                    ..strokeJoin = StrokeJoin.round),
                            ),
                          ),

                          title: Text('Division', style: TextStyle(
                              color: Colors.white)),
                          subtitle: Text('2020-12-12', style: TextStyle(
                              color: Colors.white)),
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
/*return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text(
            "Math for Kids",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Crimson",
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle:true,
          backgroundColor: Colors.green[600],
        ),
        body:  Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Text("Most recent quiz",
                      style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Text("Most recent quiz",
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ]),
        )
    );*/





