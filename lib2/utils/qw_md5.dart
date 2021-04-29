import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

// md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  //  digest.toString()
  return hex.encode(digest.bytes);
}
