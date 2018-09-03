import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
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
               child: 
                 SizedBox(
                   height: 70.0,
                    child: Card(
                      
                      color: stdwidgets[0].polar ? Colors.grey[400] : Colors.grey[700],
                      //elevation: 10.0,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: [               
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),    
                            leading: Image.asset('images/japan2.png', height: 30.0,fit: BoxFit.cover,),
                            title: const Text('  日経平均株価',style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                            subtitle: Text('Value:  ${stdwidgets[0].getrealValue}\nChang: ${stdwidgets[0].prevday}\nRatio:   ${stdwidgets[0].percent}',
                                style: TextStyle(fontSize: 10.0, color: stdwidgets[0].polar ? Colors.red : Colors.black,),),
                          ),
                          ],
                      ), 
                    ),
                  ),
              ),
              Expanded(//1行2桁目
                child: 
                SizedBox(
                  height: 70.0,
                  child: Card(
                  color: stdwidgets[1].polar ? Colors.grey[400] :Colors.grey[700],
                  margin:const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0), //all(4.0),
                  // padding: new EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                      contentPadding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),    
                      leading: Image.asset('images/usa3.png', height: 30.0,fit: BoxFit.cover,),
                      title: const Text('NYダウ',style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),),
                      subtitle: Text('Value:  ${stdwidgets[1].getrealValue}\nChang: ${stdwidgets[1].prevday}\nRatio:   ${stdwidgets[1].percent}',
                          style: TextStyle(fontSize: 10.0, color: stdwidgets[0].polar ? Colors.red : Colors.black,),),
                    ),
                  ],
                  ), 
                 ),
                ),
              ),
            ],
          ),
     
         
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