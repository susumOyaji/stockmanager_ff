import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:hacker_news_light/model/hacker_news_service_mock.dart';
//import 'package:hacker_news_light/model/news_entry.dart';



void main() {
  runApp(new MaterialApp(
    home: new FooPage(),
  ));
}

class FooPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FooPageState();
  } 
}

 


class FooPageState extends State<FooPage> {
  int page = 1;
  List<String> issues;
  bool loading = false;

@override
  void initState() {
    super.initState();
    //FooPage();
  }

  

  @override
  Widget build(BuildContext context) {
    var length = issues?.length ?? 0;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Infinite")),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == length) {
            // アイテム数を超えたので次のページを読み込む
            _load();

            // 画面にはローディング表示しておく
            return new Center(
              child: new Container(
                margin: const EdgeInsets.only(top: 8.0),
                width: 32.0,
                height: 32.0,
                child: const CircularProgressIndicator(),
              ),
            );
          } else if (index > length) {
            // ローディング表示より先は無し
            return null;
          }

          // アイテムがあるので返す
          var title = issues[index];
          return new Container(
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: new ListTile(
              key: new ValueKey<String>(title),
              title: new Text(title),
            ),
          );
        },
      ),
    );
  }

  Future<void> _load() async {
    if (loading) {
      return null;
    }
    loading = true;
    try {
      var url = "https://api.github.com/repositories/31792824/issues?page=${1}";
      var resp = await http.get(url);
      var data = json.decode(resp.body);
      setState(() {
        page += 1;
        if (data is List) {
          if (issues == null) {
            issues = <String>[];
          }
          data.forEach((dynamic elem) {
            if (elem is Map) {
              issues.add(elem['title'] as String);
            }
          });
        }
      });
    } finally {
      loading = false;
    }
  }
}