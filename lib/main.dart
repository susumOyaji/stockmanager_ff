//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stockmanager_ff/View/StorageControl.dart';
import 'ViewModel/Finance.dart';
import 'MarketStandard.dart';
import 'PortFolio.dart';
import 'dart:io';
import 'dart:async';
//import 'dart:convert';


void main() {
  runApp(new  SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}


class _SampleAppPageState extends State<SampleAppPage> {
  List widgets =[];// new List<Price>.filled(1, Price());
  List getwidgets = new List<Price>.filled(2,Price()); 
  StorageControl storageControl ;
 
   
  int i = 0;
  String responceBuff;
  String assetTotal;
  String assetPrice;
  String assetValue;
  String returncode="ソニー";
  //String assetValueString;


 //bool get enabled =>
 //RaisedButton(onPressed = false);
 //  bool iconButtonToggle;


 //String(123).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
  // OS名を取得、自分でごりごりやりたいならこちら
  //String os = Platform.operatingSystem;

  // OSごとで判定するプロパティも提供されている
  //bool isAndroid = Platform.isAndroid;
  //bool isIos = Platform.isIOS;

  @override
  void initState() {
    super.initState();
    storageControl = new StorageControl();
    getwidgets[0].polar=false; //起動時のNull対策、読込データ準備待ち
    //readata();
    reload();
   
  }

  readata()async{
    responceBuff =await storageControl.readStorage();
  }
    

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return setupDisp();
    }
  }

  void reload(){
    getserchi();
    loadData();
  }


   getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
      return false;
  }

 

  setupDisp() {
   return getListView( );
  }

  /*
 new IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null && selected != _lastIntegerSelected) {
                setState(() {
                  _lastIntegerSelected = selected;
                });
              }
            },
          ),
  */






  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 0x0B, 0x39, 0x50),
        appBar: new AppBar(
          title: new Text("StockManager for Flutter"),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'CodeNo. Search',
              onPressed: () async {
              String selected = codeserchi(returncode);
              print(selected);
              },
            ),
          ],
        ),
        body:
          Container(
            child:
              Column(
                children: <Widget>[
                  MaketStandard(
                    stdwidgets : getwidgets,
                  ),
                PortFolio(
                  portassetPrice : separate(assetPrice),
                  portassetTotal : separate(assetTotal),
                  portassetvalue:  separate(assetValue),
                ),
                new Expanded(
                  child:
                    getBody(),
                ),
                ],
              ),
          
          ),
          floatingActionButton:FloatingActionButton(
            backgroundColor: Color.fromARGB(0xFF, 0xFF, 0x7F, 0x00),
            mini: true,
            tooltip: 'Refresh', // used by assistive technologies
            child: Icon(Icons.update),
            onPressed:reload,
           
          ),
    
    );

  }




  //カンマ区切り文字列を整数に変換
  int toIntger(String char){
       String row="";
      List<String> sp = char.split(",");

      if (char == "---") return 0;
      for(int i = 0 ;i < (sp.length);++i ) {
        row += sp[i];
      }

      int num = int.parse(row);
      return num;
  }


  //整数をカンマ区切り文字列に変換する。
  String separate(String num){
   	var i = 1;
  	
  	// 文字列にする
    var stringnum = num;//"123456789123456789123456789";//String(num);
		
    // 返却用
    var separated = '';

    //Null-error回避用
    if (stringnum == null){
        stringnum = "000";
    }
    // 位置文字ずつ配列にする
    var nums = stringnum.split("");
   
    // 長さを入れとく
    var len = nums.length;

    //マイナス記号をカウントしない
    if(nums[0] == "-" ){
      --len;
    }


    // 一文字ずつ追加してくよ
    for(; i < len; ++i){
        // 後ろから追加していく
        separated = nums[(len)-i] + separated;

        // 3桁ごとにカンマ追加
        if(i % 3 == 0){
            separated = ',' + separated;
        }
     }
      separated = nums[(len)-i] + separated;
      //print(separated);
    return separated;
}



  showSearchDialog(int i) async {
    final codeController = TextEditingController();
    final anserController = TextEditingController();
    String returncode;

    codeController.text= "ソニー";
    anserController.text= " 1";
    returncode=codeController.text;

    return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('コード検索'),
        content: new SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: new ListBody(
            children: <Widget>[
              new TextField(
                  decoration: new InputDecoration(labelText: "Enter SearchCode.No"),
                  keyboardType: TextInputType.number,
                  style:TextStyle(color: Colors.indigoAccent),
                  controller:codeController,
              ),
              new TextField(
                  decoration: new InputDecoration(labelText: "Resalt"),
                  keyboardType: TextInputType.number,
                  controller:anserController,
              ),
              
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Search'),
            onPressed: () {
              /*anserController.text =*/ codeserchi(returncode);
              print(returncode);
              Navigator.of(context).pop();
            },
           ),
           new Text("$returncode"),
            new FlatButton(
            child: new Text('Chancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }





 showAlertDialog(int i) async {
    return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('投資状況'),
        content: new SingleChildScrollView(
          padding: EdgeInsets.all(0.0),
          child: new ListBody(
            children: <Widget>[
              new Text('コード ${widgets[i].code}'),
              new Text('企業名 ${widgets[i].name}'),
              new Text('取得数 ${widgets[i].stocks}数'),
              new Text('買値 ${widgets[i].itemprice}円'),
              new Text("投資額${separate((int.parse( widgets[i].stocks)*int.parse(widgets[i].itemprice)).toString())}円"),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Return'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }




  showEntryDialog(int i) async {
    final codeController = TextEditingController();
    final stockController = TextEditingController();
    final itempriceController = TextEditingController();
    codeController.text=widgets[i].code;
    stockController.text=widgets[i].stocks;
    itempriceController.text=widgets[i].itemprice;


    return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('登録情報変更'),
        content: new SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: new ListBody(
            children: <Widget>[
              //new Text('コード ${widgets[i].code}'),
              //new Text('企業名 ${widgets[i].name}'),
              //new Text('取得数 ${widgets[i].stocks}数'),
              //new Text('買値 ${widgets[i].itemprice}円'),
              new TextField(
                  decoration: new InputDecoration(labelText: "Enter new Code.No"),
                  keyboardType: TextInputType.number,
                  style:TextStyle(color: Colors.indigoAccent),
                  controller:codeController,
              ),
              new TextField(
                  decoration: new InputDecoration(labelText: "Enter New Stock"),
                  keyboardType: TextInputType.number,
                  controller:stockController,
              ),
               new TextField(
                  decoration: new InputDecoration(labelText: "Enter New Itemprice"),
                  keyboardType: TextInputType.number,
                  controller:itempriceController,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('OK'),
            onPressed: () {
             print(codeController.text+stockController.text+itempriceController.text);
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('Chancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }










  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,//<-- setState()
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      }
  );

  Widget getRow(int i) {
    //return new Padding(padding: new EdgeInsets.all(10.0), child: new Text("Row ${widgets[i]["title"]}"));

      return new Padding(padding: new EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
      child:  new GestureDetector(//------------>
          onTap: (){//投資状況
            print("Container clicked ${widgets[i].name}");
            showAlertDialog(i);
            return;
          },
          onDoubleTap: (){//エントリー修正
            print("Container Doubleclicked");
            return showEntryDialog(i);
          },
          onLongPress: (){//
            print("Container onLongPress");
          }
          ,
      child: Container(
          decoration: BoxDecoration(
          color: Color.fromARGB(0xFF, 0x32, 0x54, 0x6D),
            //border: Border.all(width: 2.0, color: Colors.black38), //枠線
          borderRadius:
            const BorderRadius.all(const Radius.circular(2.0)),
        ),

        child: Column(
        children: [
         Row( //1桁目
            children: [
            //Expanded(
                /*child:*/ Container(

                 // width: 70.0,
                 // decoration: BoxDecoration(
                 //   color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                 //   borderRadius:
                    //    const BorderRadius.all(const Radius.circular(12.0)),
                  //),

                  margin: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0), //.all(4.0),
                 // padding: new EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      Text(
                        "${widgets[i].code}",style: TextStyle(fontSize: 10.0, color: Colors.blue),
                      ),
                      Text(
                        "${widgets[i].name}",style: TextStyle(fontSize: 10.0, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              //),
              //Expanded(
                /*child:*/ Container(
                  width: 50.0,
                  //margin: 10.0,
                 // decoration: BoxDecoration(
                   // color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  //),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                 // padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "買値",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                      Text(
                        "${separate(widgets[i].itemprice.toString())}",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              //),

              Expanded(
                 child: Container(
                  //decoration: BoxDecoration(
                  //  color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  //),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                 // padding: new EdgeInsets.all(8.0),
                child: Column(
                    children: [
                      Text(
                        "現在値",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                      Text(
                        "${separate(widgets[i].realValue.toString())}",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
               Expanded(
                 child: Container(
                   // decoration: BoxDecoration(
                   // color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                  //),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                 // padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "利益",
                        style: TextStyle(fontSize: 10.0, color: Colors.red),
                      ),
                      Text(
                        "${separate(widgets[i].gain.toString())}",
                        style: TextStyle(fontSize: 10.0, fontFamily: 'Roboto',color: Colors.white),
                      ),
                    ],
                  ),
                ),
               ),
                Expanded(
                   child: Container(
                 // decoration: BoxDecoration(
                 //   color: Color.fromARGB(0xFF, 0x12, 0x44, 0x5D),
                    //border: Border.all(width: 2.0, color: Colors.black38), //枠線
                    //borderRadius:
                    //    const BorderRadius.all(const Radius.circular(2.0)),
                 // ),

                  //margin: const EdgeInsets.fromLTRB(
                  //    0.0, 0.0, 0.0, 0.0), //.all(4.0),
                 // padding: new EdgeInsets.all(10.0),
                child: Column(
                    children: [
                      Text(
                        "時価",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                      Text(
                        "${separate(widgets[i].totalAsset.toString())}",
                        style: TextStyle(fontSize: 10.0, fontFamily: 'Roboto', color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ),
                //Expanded(
                Container(
                  width: 60.0,
                  padding: EdgeInsets.all(0.0),
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child:
                    RaisedButton(
                      padding: EdgeInsets.all(0.0),
                      disabledColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      ),
                      color: widgets[i].polar ? Colors.red : Colors.blue,
                      child: new Text( widgets[i].percentcheng ? '${widgets[i].prevday}' : '${widgets[i].percent}',
                                      style: TextStyle(fontSize: 12.0, color: Colors.black),),
                      onPressed: () => setState((){
                        widgets[i].percentcheng = !widgets[i].percentcheng;
                      }),
                    ),
                ),
            ]),
        ],),
      ),
      ),
     );
  }



  String serchiSet (String code){
      return codeserchi(code);
  }


  codeserchi(String returncode ) async {
   
    String getCode="";
   
   
      http.Response response = await http.get(_getCode(returncode)/*dataURL*/);
      final String json = response.body;

      //String searchWord = code; //検索する文字列symbol
      int foundIndex = json.indexOf(returncode, 0);
      
      foundIndex = json.indexOf("slk:chart"+";"+"pos:1", 0);
      int i = 0;//searchWord.length; //pricedata to point
      //始めの位置を探す
      int nextIndex = foundIndex + i;
      

      foundIndex = json.indexOf("【",nextIndex);
      
      if (foundIndex != -1) {
        for (i=1; json[foundIndex + i] != "】"; i++) {
          getCode += json[foundIndex + i];//getCode += json[foundIndex + i]; //current value 現在値
        }
      } else {
        print("Error");
      }
      setState(() {
        //print( getCode );
        returncode = getCode;
        //return code;
      });
      //return code;
    
 }//load

 

  void getserchi( ) async
  {
    // http.Client _httpClient;
  // _httpClient = new http.Client();

  //static bool actuallyFetchData = true;

  //String _fetchNextChunk() {
    String gcompanyName = "";
    String grealValue = "";
    String grealChange = "";
    String gpercent = "";
    bool change = true;
    

    //String responce ="6758,200,1665\n9837,200,712\n6976,200,1746\n";
    String responce ="998407,0,0\n^DJI,0,0\n";
    // String responce ="998407.O,0,0\n^DJI,0,0\n";
    List<Price> gprices = Finance.parse(responce);


    for(Price price in gprices) {
      http.Response response = await http.get(_geturlToFetch(price.code)/*dataURL*/);
      final String json = response.body;

      String searchWord = "symbol"; //検索する文字列symbol
      int foundIndex = json.indexOf(searchWord, 0);
      //始めの位置を探す
      int nextIndex = foundIndex + searchWord.length;

      foundIndex = json.indexOf(">", nextIndex);
      int i = 5;//searchWord.length; //pricedata to point

      if (foundIndex != -1) {
        for (; json[foundIndex + i] != "<"; i++) {
          gcompanyName += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      searchWord = "stoksPrice"; //検索する文字列 ="stoksPrice">
      foundIndex = json.indexOf(searchWord); //始めの位置を探す
      //次の検索開始位置
      nextIndex = foundIndex + searchWord.length;

      //次の位置を探す
      foundIndex = json.indexOf(searchWord, nextIndex);
      if (foundIndex != -1) {
        int i = searchWord.length + 2; //pricedata to point
        for (; json[foundIndex + i] != "<"; i++) {
          grealValue += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      String searchWord1 = "yjMSt"; //検索する文字列前日比
      int foundIndex1 = json.indexOf(searchWord1); //始めの位置を探す
      int i1 = searchWord1.length + 2;

      if (json[foundIndex1 + i1] == "+"){change = true;}//+-
      else{change = false;}

      for (; json[foundIndex1 + i1] != "（"; i1++) {
        grealChange += json[foundIndex1 + i1]; //previous 前日比? ¥
      }

      i1++;
      for (; json[foundIndex1 + i1] != "）"; i1++) {
        gpercent += json[foundIndex1 + i1]; //previous 前日比? %
      }

      price.percentcheng=true;
      price.polar= change;
      //iconButtonToggle=true;//.polar;
      price.name = gcompanyName;//企業名
      price.getrealValue = grealValue;//realValue);//時価
      price.prevday = grealChange;//前日比(円)
      price.percent = gpercent;//前日比(%)
      //price.gain = (price.realValue - int.parse(price.itemprice))*int.parse(price.stocks);// (時価 - 購入価格)X買付数
      //price.totalAsset = int.parse(price.stocks) * price.realValue;//買付数ｘ時価

      //assetTotal += price.totalAsset;
      //assetPrice += (int.parse(price.itemprice))*int.parse(price.stocks);

      print(price.name);
      print(price.realValue);
      print(price.prevday);
      print(price.percent);


      gcompanyName = "";
      grealValue = "";
      grealChange = "";
      gpercent = "";
   }//for to end

    setState(() {
      getwidgets =  gprices;
    });
 }//load






  String _getCode(String code){
    return "https://info.finance.yahoo.co.jp/search/?query=" + code;
  }
    
  String _geturlToFetch(String code) {
    return "https://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ code ;//+".T";
  }

  String _urlToFetch(String code) {
    return "https://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ code +".T";
  }







  void loadData() async {

  // http.Client _httpClient;
  // _httpClient = new http.Client();

  //static bool actuallyFetchData = true;

  //String _fetchNextChunk() {
    String companyName = "";
    String realValue = "";
    String realChange = "";
    String percent = "";
    bool change = true;
    int _assetTotal=0;
    int _assetPrice=0;
    
      

    storageControl.writeStorage("6758,200,1665\n9837,200,712\n6976,200,1746\n6753,0,0\n");
   
    String responce = await storageControl.readStorage();
    //String responce = responceBuff;
    //String responce ="6758,200,1665\n9837,200,712\n6976,200,1746\n6753,0,0\n";
    List<Price> prices = Finance.parse(responce);


    for(Price price in prices) {

      http.Response response = await http.get(_urlToFetch(price.code)/*dataURL*/);
      final String json = response.body;

      String searchWord = "symbol"; //検索する文字列symbol
      int foundIndex = json.indexOf(searchWord, 0);
      //始めの位置を探す
      int nextIndex = foundIndex + searchWord.length;

      foundIndex = json.indexOf(">", nextIndex);
      int i = 5;//searchWord.length; //pricedata to point

      if (foundIndex != -1) {
        for (; json[foundIndex + i] != "<"; i++) {
          companyName += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      searchWord = "stoksPrice"; //検索する文字列 ="stoksPrice">
      foundIndex = json.indexOf(searchWord); //始めの位置を探す
      //次の検索開始位置
      nextIndex = foundIndex + searchWord.length;

      //次の位置を探す
      foundIndex = json.indexOf(searchWord, nextIndex);
      if (foundIndex != -1) {
        int i = searchWord.length + 2; //pricedata to point
        for (; json[foundIndex + i] != "<"; i++) {
          realValue += json[foundIndex + i]; //current value 現在値
        }
      } else {
        //price[0] = "Error";
      }

      String searchWord1 = "yjMSt"; //検索する文字列前日比
      int foundIndex1 = json.indexOf(searchWord1); //始めの位置を探す
      int i1 = searchWord1.length + 2;

      if (json[foundIndex1 + i1] == "+"){change = true;}//+-
      else{change = false;}
      for (; json[foundIndex1 + i1] != "（"; i1++) {
        realChange += json[foundIndex1 + i1]; //previous 前日比? ¥
      }

      i1++;
      for (; json[foundIndex1 + i1] != "）"; i1++) {
        percent += json[foundIndex1 + i1]; //previous 前日比? %
      }

      price.percentcheng=true;
      price.polar= change;
      //iconButtonToggle=true;//.polar;
      price.name = companyName;//企業名
      price.realValue =  toIntger(realValue);//realValue);//時価
      price.prevday = realChange;//前日比(円)
      price.percent = percent;//前日比(%)
      price.gain = (price.realValue - int.parse(price.itemprice))*int.parse(price.stocks);// (時価 - 購入価格)X買付数
      price.totalAsset = int.parse(price.stocks) * price.realValue;//買付数ｘ時価

      _assetTotal += price.totalAsset;
      _assetPrice += (int.parse(price.itemprice))*int.parse(price.stocks);

      print(price.name);
      print(price.realValue);
      print(price.prevday);
      print(price.percent);


      companyName = "";
      realValue = "";
      realChange = "";
      percent = "";
  
  }//for to end

   setState(() {
    assetTotal =  _assetTotal.toString();
    assetPrice =  _assetPrice.toString();
    assetValue = (_assetTotal - _assetPrice).toString();
  
    widgets =  prices;
});

 }//load

}//stste to end

/*Root Widget
class StockView extends StatelessWidget{
  // 訳追記 Dartの名前付きコンストラクタ記法と、クラスフィールドへのアサインを省略する記法の組み合わせ
  // new StockView(title: foo)
  StockView({this.title});

  // ウィジェットサブクラスのフィールドは常にfinalとマークされます
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: new Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          new MaketStandard(

          ),
          new PortFolio(

          ),
        ],
      ),
    );
  }
}
*/
