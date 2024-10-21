// services/domain_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DomainService {
  static const String ossDomain =
      'https://bob-1327268024.cos.ap-shanghai.myqcloud.com/websites.json';

// 从返回的 JSON 中挑选一个可以正常访问的域名
    static Future<String> fetchValidDomain() async {
      try {
          final response = await http
              .get(Uri.parse(ossDomain))
              .timeout(const Duration(seconds: 10));
          
          final List<dynamic> websites = json.decode(response.body) as List<dynamic>;
          if (websites.isNotEmpty) {
              final Map<String, dynamic> websiteMap = websites[0] as Map<String, dynamic>;
              final String domain = websiteMap['url'] as String;
              return domain; // 直接返回第一个域名
          } else {
              throw Exception('No domains found in the response.');
          }
      } catch (e) {
          if (kDebugMode) {
              print('Error fetching valid domain: $ossDomain:  $e');
          }
          rethrow;
      }
  }
}
