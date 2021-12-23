import 'dart:convert';

import 'package:farm_market_app/utils/string/string.dart';

class EncryptTop3 {
  static String newGetKey(String data, int password, int password2) {
    String listOfNumbers = password2.toString();

    //get all numbers in data
    for (int i = 0; i<=2; i++) {
      //if current character is number
      String charInIndex = StringUtils.charAt(data, i);
        int numberInIndex = int.parse(StringUtils.charAt(data, i));
    }
    String originalKey = "";
    if (listOfNumbers.length > 15)
      originalKey = listOfNumbers.substring(0, 15);
    else
      originalKey = listOfNumbers.toString();
    return (int.parse(originalKey) + password).toString();
  }

  static String encryption(String dataInString) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String base64String = stringToBase64.encode(dataInString);
    String encrypt =
        base64String + '-' + newGetKey(base64String, 7123358024, 3564);
    return encrypt;
  }
}