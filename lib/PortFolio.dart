
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
        Container(//-------->>
          decoration: BoxDecoration(
            //color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
            borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
          ),
          child: 
            Row(
              children:<Widget> [
                SizedBox(
                  height: 65.0,
                  width: 100.0,
                  child: new Card(
                    margin: new EdgeInsets.all(0.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       
                       // new Padding(
                       //   padding: new EdgeInsets.all(7.0),
                       //   child: new Column(
                       //      children: <Widget>[
                            // new Padding(
                        
                        new TextField(
                          //controller: _textController,
                          //textAlign: TextAlign.justify,
                          
                          style: TextStyle(fontSize: 12.0,color:Colors.red),
                          onChanged: (String text) {
                          //setState(() {
                          //_isComposing = text.length > 0;
                          //});
                          },
                          //onSubmitted: _handleSubmitted,
                          decoration:new InputDecoration(
                            labelText: 'search.',
                            hintText: "Name",
                            border:new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                              const Radius.circular(12.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.red,
                              width: 250.0,
                            ),
                          ),
                        ),
                        
                            /*           
                       TextField(
                          style: TextStyle(fontSize: 9.0,color:Colors.black),
                          autofocus: false,
                          
                          decoration: InputDecoration(
                      
                   
                            border:new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                          ),
                          labelStyle: TextStyle(fontSize: 1.0,color: Colors.black),
                          hintText: 'Code to search.',
                          labelText: 'search.',
                          ),*/
                      //onChanged: (inputString) {
                      //if (inputString.length >= 4) {
                    //_isComposing = true;  
                    //_searchRepositories1(inputString).then((repositories) {
                    //setState(() {
                    // _repositories1 = repositories;
                    // showBasicDialog(context);
                    //});
                  //});
                     // }
                    //},*/
                       ),
                      ],
                    ),
                  ),
                  ),
             
                Expanded(
                  flex: 2,
                  child:new Card(
                    color: Colors.black,
                    child:
                    //margin: new EdgeInsets.all(0.0),
                    new Container(
                      decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
                      borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                      child:
                        new Row(
                          children: <Widget>[
                            Expanded(child:
                            new Column(
                              children: <Widget>[                  
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),//EdgeInsets.all(5.0),
                                  child:new Text('投資状況',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child:new Text('投資総額',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text("${portassetPrice.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                                ), 
                              ],
                            ),
                            ),
                            Expanded(child:
                            new Column(
                              children: <Widget>[                  
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text('',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text('評価総額',style: new TextStyle(fontSize: 10.0, color: Colors.white),),
                                ), 
                                new Padding(
                                  padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                                  child: new Text("${portassetTotal.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                                ), 
                              ],
                            ),
                            ),
                          ],
                        ), 
                      ),
                  ),
                ),
                //),

               
              Expanded(
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius:const BorderRadius.all(const Radius.circular(10.0)),
                ),
                margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //all(4.0),
                padding: new EdgeInsets.all(0.0),
                child: Card(
                  color: Colors.purple,
                  child:Container(
                    child:Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                          child:new Text("損益", style: TextStyle(fontSize: 10.0, color: Colors.black)),
                            //Text("${portassetvalue.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                          child:new Text("${portassetvalue.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
