import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';





class  StorageControl{
  //StorageControl(){}//コンストラクタ

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readStorage() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      //print("Read to Data= " + contents);
      return contents;
    } catch (e) {
      // If we encounter an error, return 0
      return null;
    }
  }

  Future<File> writeStorage(String value) async {
    final file = await _localFile;
    //print("Write to fileName= ${file.toString()}   " + value);
    // Write the file
    return file.writeAsString(value);
  }
}

