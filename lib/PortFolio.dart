
import 'package:flutter/material.dart';
//import 'Separater.dart';

   //Parsonal Data Disp
  class PortFolio extends StatelessWidget{
    PortFolio({this.portassetPrice, this.portassetTotal, this.portassetvalue});
    final String portassetPrice; 
    final String portassetTotal ;
    final String portassetvalue;

     
   
      
      @override
      Widget build(BuildContext context) {
      return new Container(
        padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        decoration: BoxDecoration(
        color: Color.fromARGB(0xFF, 0x0B, 0x39, 0x50),
        borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
        
      ),
      child: Column(
        children: [
            new Row(//Divider
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Divider(
                    color: Colors.white,
                  ),
                ),
              new Padding(
                padding:  new EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: new Text("Overall Profit and loss",style: new TextStyle(fontSize: 10.0, color: Colors.orange),),
              ),
              new Expanded(
                child: new Divider(
                color: Colors.white,
                ),
              ),
              ],
            ),
        Container(//-------->>
          decoration: BoxDecoration(
            //color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
            borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
          ),
          child: 

            Row(
              children:<Widget> [
                Expanded(
                  child:new Container(
                    padding: EdgeInsets.all(0.0),
                    margin: new EdgeInsets.all(0.0),
                    child:new IconButton(
                      icon: new Icon(Icons.add_box),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child:new Card(
                    color: Colors.orange,
                    child:
                    //margin: new EdgeInsets.all(0.0),
                    //new Container(
                    //  decoration: BoxDecoration(
                    //  color: Colors.black,
                    //  border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
                    //  borderRadius:
                    //    const BorderRadius.all(const Radius.circular(10.0)),
                    //  ),
                      //child:
                        new Row(
                          children: <Widget>[
                            
                            Expanded(child:
                            new Column(
                              children: <Widget>[                  
                                /*new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),//EdgeInsets.all(5.0),
                                  child:new Text('投資状況',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ),*/ 
                                
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child:new Text('投資総額',style: new TextStyle(fontSize: 10.0, color: Colors.black),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 10.0, left: 0.0),
                                  child: new Text("${portassetPrice.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                                ), 
                              ],
                            ),
                            ),
                            Expanded(child:
                            new Column(
                              children: <Widget>[                  
                                /*new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text('',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ), */
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text('評価総額',style: new TextStyle(fontSize: 10.0, color: Colors.black),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 10.0, left: 0.0),
                                  child: new Text("${portassetTotal.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                                ), 
                              ],
                            ),
                            ),
                          ],
                        ), 
                     // ),
                  ),
                ),
                //),

               
              Expanded(
                /*
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius:const BorderRadius.all(const Radius.circular(2.0)),
                ),
                margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //all(4.0),
                padding: new EdgeInsets.all(0.0),
                */
              
                child: Card(
                  color: Colors.purple,
                  //child:Container(
                    child:Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                          child:new Text("損益", style: TextStyle(fontSize: 10.0, color: Colors.black)),
                            //Text("${portassetvalue.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 10.0, left: 0.0),
                          child:new Text("${portassetvalue.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  //),
                ),
              //),
              ),
                  
            ],
          ),
       ), 
                  //),
            //getListView(),
         
            /*
            new Expanded(
            child: new Container(
              decoration: BoxDecoration(
              color: Color.fromARGB(0xFF, 0x55, 0x44, 0x5D),
              //borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
              ),
              child:  getListView(),
            ),
            ),*/
         ],),
      
    );

  }
}
