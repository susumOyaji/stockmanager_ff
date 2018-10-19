import 'package:flutter/material.dart';
//import 'dart:async';
//import 'main.dart';
import 'ViewModel/Finance.dart';
 
/*
  class MaketStandardview extends StatefulWidget {
    MaketStandardview ({Key key,this.stdwidgets}) : super(key: key);
    final List stdwidgets; 

  
  @override
  State createState() => new MaketStandard();
}
*/

//class MaketStandard extends State<MaketStandardview> {


/*
@override
  Widget build(BuildContext context) {
    StreamBuilder<uiState.UiState> builder = new StreamBuilder(
      stream: new uiState.StateSubject().screenEvent(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasError) {
          return new Text("Error!");
        } else if (asyncSnapshot.data == null) {
          return new SplashScreen();
        }else {
          switch (asyncSnapshot.data.state) {
            case uiState.State.login: return new LoginScreen();
            case uiState.State.count: return new CountScreen();
            case uiState.State.list: return new NumberListScreen();
            default: return null;
          }
        }
      });

*/






 //Nikkey And NewYork Dow Display
class MaketStandard extends StatelessWidget{
  MaketStandard({this.stdwidgets});
  final List<Price> stdwidgets;// = new List.generate(2, (index) => index);
  //stdwidgets[0].polar ?? false;
 
  @override
  Widget build(BuildContext context) {
  //Widget marketStandard(int i){
  return new Container(
    //height: 10.0,
      decoration: BoxDecoration(
        color: Color.fromARGB(0xFF, 0x0B, 0x39, 0x50),
      ),
      margin: const EdgeInsets.fromLTRB(
                      0.0, 0.0, 0.0, 0.0), //.all(4.0),
      //padding: new EdgeInsets.all(0.0), 
      child: Column(
        children:[
        Row(//1行目
            children: [
            Expanded(
               child: new Card(
                      color: stdwidgets[0].polar ? Colors.grey[400] : Colors.grey[700],
                      //elevation: 10.0,
                      margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                             new Padding(
                              padding: new EdgeInsets.only(left: 40.0),//EdgeInsets.all(5.0),
                               child: new Text('日経平均株価',style: new TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                             ), 
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('株価     :${stdwidgets[0].getrealValue}',style: new TextStyle(fontSize: 10.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('前日比 :${stdwidgets[0].prevday}',style: new TextStyle(fontSize: 10.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('変動率 :${stdwidgets[0].percent}',style: new TextStyle(fontSize: 10.0),),
                             ),
                              /*
                        children: [               
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),    
                            leading: Image.asset('images/japan2.png', height: 30.0,fit: BoxFit.cover,),
                            title: const Text('  日経平均株価',style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                            subtitle: Text('Value:  ${stdwidgets[0].getrealValue}\nChang: ${stdwidgets[0].prevday}\nRatio:   ${stdwidgets[0].percent}',
                                style: TextStyle(fontSize: 10.0, color: stdwidgets[0].polar ? Colors.red : Colors.black,),),
                          ),*/
                        ],
                      ), 
                    ),
                  //),
            ),
              Expanded(//1行2桁目
               child: Card(
                  color: stdwidgets[1].polar ? Colors.grey[400] :Colors.grey[700],
                  margin:const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0), //all(4.0),
                  // padding: new EdgeInsets.all(8.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Padding(
                              padding: new EdgeInsets.only(left: 40.0),//EdgeInsets.all(5.0),
                               child: new Text('ＮＹダウ',style: new TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                             ), 
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('株価     :${stdwidgets[1].getrealValue}',style: new TextStyle(fontSize: 10.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('前日比 :${stdwidgets[1].prevday}',style: new TextStyle(fontSize: 10.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.only(left:10.0),
                               child: new Text('変動率 :${stdwidgets[1].percent}',style: new TextStyle(fontSize: 10.0),),
                             ),
                  ],
                  ), 
                 ),
               // ),
              ),
              
            ],
          ),
       
        
        /*
        import 'package:flutter/material.dart';
        import 'package:super_simple_budget/generated/i18n.dart';

        class Divider extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
        return new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          new Expanded(
            child: new Divider(
          color: Colors.white,
        )),
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("S.of(context).history"),
        ),
        new Expanded(
            child: new Divider(
          color: Colors.white,
        )),
      ],
    );
  }
}
*/
          //new Expanded(
            //child: new Container(
              //decoration: BoxDecoration(
              //color: Color.fromARGB(0xFF, 0xFF, 0x44, 0x5D),
              //borderRadius: const BorderRadius.all(const Radius.circular(3.0)),
              //),
          //    padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              //height: 10.0,
          //    child:  portFolio(),
         //   ),
         // ),

          ],),
         
      );
    
}
}//market