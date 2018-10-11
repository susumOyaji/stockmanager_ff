
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
              Expanded(
                child: Container(//Search
                  // padding: new EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                  margin: EdgeInsets.all(0.0),
                  child: TextField(
                    style: TextStyle(fontSize: 12.0,color:Colors.orange),
                    autofocus: false,
                    decoration: InputDecoration(
                      
                    //prefixIcon: Icon(Icons.search),
                      border:new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.yellow,
                          width: 5.0,
                        ),
                      ),
                      labelStyle: TextStyle(fontSize: 12.0,color: Colors.orange),
                      hintText: 'Code to search.',
                      labelText: 'search.',
                    ),
                    onChanged: (inputString) {
                      if (inputString.length >= 4) {
                    //_isComposing = true;  
                    //_searchRepositories1(inputString).then((repositories) {
                    //setState(() {
                    // _repositories1 = repositories;
                    // showBasicDialog(context);
                    //});
                  //});
                      }
                    },
                  )
                ),
              ),

             
               
                
                  
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.yellow,
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:const BorderRadius.all(const Radius.circular(2.0)),
                  ),
                    margin: const EdgeInsets.fromLTRB(4.0, 5.0, 0.0, 0.0), //.all(4.0),
                    padding: new EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Text(
                            "投資状況",
                            style: TextStyle(fontSize: 12.0, color: Colors.orange),
                          ),
                        ],
                      ), 
                  ),
                ),
              
              Expanded(
                //1行2桁目
                child: Container(
                  //decoration: BoxDecoration(
                   //color: Colors.orangeAccent,
                    //border: Border.all(width: 2.0, color: Colors.black38),
                   // borderRadius:
                   //     const BorderRadius.all(const Radius.circular(2.0)),
                 // ),
                  margin:
                      const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0), //all(4.0),
                  padding: new EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("投資総額", style: TextStyle(fontSize: 9.0, color: Colors.white)),
                      Text("${portassetPrice.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.white)),
                    ],
                  ), // Text("1行2桁目"), //Image.asset('images/pic2.jpg'),
                ),
              ),

              Expanded(
                child: Container(
                 // decoration: BoxDecoration(
                    //color: Colors.yellow,
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                  //  borderRadius:
                  //      const BorderRadius.all(const Radius.circular(2.0)),
                 // ),
                      margin: const EdgeInsets.fromLTRB(
                      0.0, 5.0, 0.0, 0.0), //.all(4.0),
                  padding: new EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("時価総額",style: TextStyle(fontSize: 9.0, color: Colors.white)),
                      Text(
                        "${portassetTotal.toString()}",
                        style: TextStyle(fontSize: 12.0, color: Colors.red),
                      ),
                    ],
                  ), // Image.asset('images/pic1.jpg'),
                ),
              ),

              Expanded(
                //1行2桁目
                flex: 1,
                child: Container(
                 decoration: BoxDecoration(
                 color: Colors.purple,
                 //border: Border.all(width: 1.0, color: Colors.black),
                 borderRadius:
                      const BorderRadius.all(const Radius.circular(2.0)),
                  ),
                 // margin:const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //all(4.0),
                  padding: new EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("損益", style: TextStyle(fontSize: 10.0, color: Colors.white)),
                      Text("${portassetvalue.toString()}", style: TextStyle(fontSize: 12.0, color: Colors.black)),
                    ],
                  ),
                ),
              ),
              
            ],),
         
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
