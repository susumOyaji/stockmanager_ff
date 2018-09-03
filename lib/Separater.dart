

class Separater{
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

    // 位置文字ずつ配列にする
    var nums = stringnum.split('');

    // 長さを入れとく
    var len = nums.length;

    // 一文字ずつ追加してくよ
    for(; i < len; ++i){
        // 後ろから追加していく
        separated = nums[(len)-i] + separated;

        // 3桁ごとにカンマ追加
        if(i % 3 == 0){
            separated = ',' + separated;
        }
     }
    print(separated);
		separated = nums[(len)-i] + separated;
    return separated;
  }
}