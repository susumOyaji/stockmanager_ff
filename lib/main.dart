//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stockmanager_ff/View/StorageControl.dart';
import 'ViewModel/Finance.dart';
import 'MarketStandard.dart';
import 'PortFolio.dart';
//import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
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
  bool _isComposing = false; 
  String  _repositories1;
   
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
   //historyDivider();
   return gridView( );
  }

 



  historyDivider() {
 // @override
  //Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Expanded(
            child: new Divider(
          color: Colors.white,
        )),
        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("Profit and loss of each",style: new TextStyle(fontSize: 10.0, color: Colors.yellow),),
        ),
        new Expanded(
            child: new Divider(
          color: Colors.white,
        )),
      ],
    );
  }

 






  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(0xFF, 0x0B, 0x39, 0x50),
        appBar: new AppBar(
          title: new Text("StockManager for Flutter"),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_box),
              tooltip: 'CodeNo. Search',
              onPressed: () {
                _methodsInput(context);//_buildInput();
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
                  historyDivider(),
                  //new Padding(
                    //padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                   // addSearch(),
                  //),
                  new Expanded(
                    child:getBody(),
                  ),
                ],
              ),
          
          ),
          floatingActionButton:FloatingActionButton(
            backgroundColor: Color.fromARGB(0xFF, 0xFF, 0x7F, 0x00),
            mini: true,
            tooltip: 'Refresh', // used by assistive technologies
            child: Icon(Icons.update),
            onPressed: reload,
           
          ),
    
    );

  }

  Widget _buildInput() {
  return Container(
    margin: EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Please enter a search repository name.',
        labelText: "search"
      ),
      onChanged: (inputString) {
        if (inputString.length >= 4) {
           _isComposing = true;  
          _searchRepositories1(inputString).then((repositories) {
            setState(() {
              _repositories1 = repositories;
              showBasicDialog(context);
            });
          });
        }
      },
    )
  );
}

Future _methodsInput(BuildContext context) async{
    final codeController = TextEditingController();
    final stockController = TextEditingController();
    final itempriceController = TextEditingController();
    //codeController.text=widgets[i].code;
    stockController.text=widgets[i].stocks;
    itempriceController.text=widgets[i].itemprice;


    return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('登録'),
        content: new SingleChildScrollView(
        padding: EdgeInsets.all(0.0),
        child: new ListBody(
            children: <Widget>[
              new TextField(
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Please enter a search repository name.',
                labelText: "search"
                ),
                onChanged: (inputString) {
                  if (inputString.length >= 4) {
                    _isComposing = true;  
                    _searchRepositories1(inputString).then((repositories) {
                      setState(() {
                        _repositories1 = repositories;
                      showBasicDialog(context);
                      });
                    });
                  }
                },
              ),
   
       
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('OK'),
            onPressed: () {
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



void showBasicDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
    new CupertinoAlertDialog(
    title: Text("Result"),
    content:  _isComposing ? Text("${_repositories1}"):Text("non"),
    actions: <Widget>[
    CupertinoDialogAction(
        child: const Text("Register"),
        isDefaultAction: true,
        onPressed: () {
         Navigator.pop(context);
        },
      ),
      CupertinoDialogAction(
        child: const Text("Cansel"),
        isDestructiveAction: true,
        onPressed: () { 
          Navigator.pop(context);
         },
      ),
    ],
  ),
  
  );
  
}



//ソニー
Future<String> _searchRepositories1(String searchWord ) async {
   
    String getCode="";
    String list;
   
      http.Response response = await http.get("https://info.finance.yahoo.co.jp/search/?query=" + searchWord);
      http.Response response1 = await http.get("https://info.finance.yahoo.co.jp/search/?query=ソニー");
      final String json = response1.body;

      String searchKeyWord = "slk:chart;pos:1"; //検索する文字列symbol
      //int foundIndex = json.indexOf(returncode, 0);
      
      int foundIndex = json.indexOf(searchKeyWord, 0);
      if (foundIndex == -1){
        return list ="Not Faund";
      }



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
        return list ="Error";
      }
      //setState(() {
        //print( getCode );
        //list = getCode;
        //return code;
      //});
      return list= getCode;
    
 }//load







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

   Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
       // height: 10.0,
       // padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
       // margin: const EdgeInsets.symmetric(vertical: 0.0),
        child: new Row(
          //mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //new Flexible(
              /*child:*/ new TextField(
                //controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                //onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Input a Name"),
              ),
            //),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                //onPressed: _isComposing ? () => _handleSubmitted(_textController.text) : null,                                           //modified
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget addSearch(){
    return new Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
      child: 
    Container(
      //height: 60.0,

      color: Colors.white,
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
      child:Row(
        children: <Widget>[
           SizedBox(
                  height: 60.0,
                  width: 50.0,
                child:
               
                new TextField(
                          //controller: _textController,
                          //textAlign: TextAlign.justify,
                          
                          style: TextStyle(fontSize: 9.0,color:Colors.red),
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
                              const Radius.circular(2.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.red,
                              width: 350.0,
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
                ),
              
               
        ]
      ),
              
    ),    
      );
    
  }






  GridView gridView() => new GridView.builder(
        itemCount: widgets.length,//<-- setState()
        //itemCount: 2,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),//横方向の表示数
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
          
            child: new Card(
              elevation: 2.0,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("(${widgets[index].code}) "+"${widgets[index].name}",style: TextStyle(fontSize: 9.0, color: Colors.white),),//new Text('Item $index'),
                    new Text("現在値 ${separate(widgets[index].realValue.toString())}",style: TextStyle(fontSize: 10.0, color: Colors.white),),
                    new Text("利益　${separate(widgets[index].gain.toString())}",style: TextStyle(fontSize: 10.0, fontFamily: 'Roboto',color: Colors.yellow),),
                    new Padding(
                      padding: new EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
                      child:SizedBox(
                      height: 15.0,
                      width: 60.0,  
                      child:RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        disabledColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                        color: widgets[index].polar ? Colors.red : Colors.blue,
                        child: new Text( widgets[index].percentcheng ? '${widgets[index].prevday}' : '${widgets[index].percent}',
                                      style: TextStyle(fontSize: 12.0, color: Colors.black),),
                        onPressed: () => setState((){
                          widgets[index].percentcheng = !widgets[index].percentcheng;
                        }),
                      ),
                    ),
                   ),
                ],
              
              ),
                //alignment: Alignment.center,
                //child: new Text("${widgets[index].code}",style: TextStyle(fontSize: 10.0, color: Colors.white),),//new Text('Item $index'),
              ),
            ),
          
            onTap: () {
               showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                      new Text("買値 : ${separate(widgets[index].itemprice.toString())}",style: TextStyle(fontSize: 10.0, color: Colors.black),),
                      new Text("取得株数 : ${separate(widgets[index].stocks.toString())}",style: TextStyle(fontSize: 10.0, color: Colors.red),),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
            onDoubleTap: (){//エントリー修正
            print("Container Doubleclicked");
            return showEntryDialog(i);
            },
            onLongPress: (){//
              print("Container onLongPress");
            },

          );
        });





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

 

  Future getserchi( ) async {
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







  Future loadData() async {

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
