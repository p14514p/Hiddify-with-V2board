// services/domain_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class DomainService {
  static const String ossDomain =
      'https://bob-1327268024.cos.ap-shanghai.myqcloud.com/websites.json';

  // 直接返回一个具体的域名
  static Future<String> fetchValidDomain() async {
    // 直接返回你想要的具体链接
    return 'https://nhyapi.vo0.site'; // 替换为你想要的具体链接
  }
}
