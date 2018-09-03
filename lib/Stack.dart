import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double appBarHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Scaffold(
          appBar: new PreferredSize(
            preferredSize: new Size(MediaQuery.of(context).size.width, appBarHeight),
            child: new Container(
              color: Colors.blue,
              child: new Container(
                  margin:const EdgeInsets.only(top: 30.0),
                  child: new Column(children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                                icon: new Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                }
                            ),
                            new Text(
                              "Controller Name",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]
                  )
              )
            )
          ),
          body: new Center(
            child: new Text('Hello!'),
          ),
        ),
        new Positioned(
          child: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              print('FAB tapped!');
            },
            backgroundColor: Colors.blueGrey,
          ),
          right: 10.0,
          top: appBarHeight - 5.0,
        )
      ],
    );
  }
}