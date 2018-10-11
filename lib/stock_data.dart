// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Snapshot from http://www.nasdaq.com/screening/company-list.aspx
// Fetched 2/23/2014.
// "Symbol","Name","LastSale","MarketCap","IPOyear","Sector","industry","Summary Quote",
// Data in stock_data.json

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final math.Random _rng = new math.Random();

class Stock {
  String symbol;
  String name;
  double lastSale;
  String marketCap;
  double percentChange;

  Stock(this.symbol, this.name, this.lastSale, this.marketCap,
      this.percentChange);

  Stock.fromFields(List<String> fields) {
    // FIXME: This class should only have static data, not lastSale, etc.
    // "Symbol","Name","LastSale","MarketCap","IPOyear","Sector","industry","Summary Quote",
    lastSale = 0.0;
    try {
      lastSale = double.parse(fields[2]);
    } catch (_) {}
    symbol = fields[0];
    name = fields[1];
    marketCap = fields[4];
    percentChange = (_rng.nextDouble() * 20) - 10;
  }
}

class StockData extends ChangeNotifier {
  StockData() {
    if (actuallyFetchData) {
      _httpClient = new http.Client();
      _fetchNextChunk();
    }
  }

  final List<String> _symbols = <String>[];
  final Map<String, Stock> _stocks = <String, Stock>{};

  Iterable<String> get allSymbols => _symbols;

  Stock operator [](String symbol) => _stocks[symbol];

  bool get loading => _httpClient != null;

  void add(List<dynamic> data) {
    for (List<dynamic> fields in data) {
      final Stock stock = new Stock.fromFields(fields.cast<String>());
      _symbols.add(stock.symbol);
      _stocks[stock.symbol] = stock;
    }
    _symbols.sort();
    notifyListeners();
  }

  static const int _chunkCount = 1;
  int _nextChunk = 0;

  String _urlToFetch(int chunk) {
    //return 'https://domokit.github.io/examples/stocks/data/stock_data_$chunk.json';
    return "https://stocks.finance.yahoo.co.jp/stocks/detail/?code=6976.T"; // +".T";
    //return 'https://yahoo.co.jp';
  }

  http.Client  _httpClient;

  static bool actuallyFetchData = true;

  String _fetchNextChunk()  {
    String companyName = "";
    String realValue = "";
    String realChange = "";
    String percent = "";

      _httpClient.get(_urlToFetch(_nextChunk++)).then<Null>((http.Response response) {
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
      //try
      // {
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

      for (; json[foundIndex1 + i1] != "（"; i1++) {
        realChange += json[foundIndex1 + i1]; //previous 前日比? ¥
      }

      i1++;
      for (; json[foundIndex1 + i1] != "）"; i1++) {
        percent += json[foundIndex1 + i1]; //previous 前日比? %
      }

      print(companyName);
      print(realValue);
      print(realChange);
      print(percent);
      

      if (json == null) {
        debugPrint('Failed to load stock data chunk ${_nextChunk - 1}');
        _end();
        return;
      }

      const JsonDecoder decoder = const JsonDecoder();
      //add(decoder.convert(json));
      if (_nextChunk < _chunkCount) {
        _fetchNextChunk();
      } else {
        _end();
      }
    });
    return percent;
  }

  void _end() {
    _httpClient?.close();
    _httpClient = null;
  }
}
