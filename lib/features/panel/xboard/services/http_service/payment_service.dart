// services/payment_service.dart
import 'package:hiddify/features/panel/xboard/services/http_service/http_service.dart';

class PaymentService {
  final HttpService _httpService = HttpService();

  Future<Map<String, dynamic>> submitOrder(
      String tradeNo, String method, String accessToken,) async {
    return await _httpService.postRequest(
      "/api/v1/user/order/checkout",
      {"trade_no": tradeNo, "method": method},
      headers: {'Authorization': accessToken},
    );
  }

  Future<List<dynamic>> getPaymentMethods(String accessToken) async {
    final response = await _httpService.getRequest(
      "/api/v1/user/order/getPaymentMethod",
      headers: {'Authorization': accessToken},
    );
  
    // 检查 response['data'] 是否存在并且是一个列表
    if (response.containsKey('data') && response['data'] is List) {
      // 过滤掉 null 值
      return (response['data'] as List).where((item) => item != null).cast<dynamic>().toList();
    } else {
      throw Exception('Invalid response format or data is not a list');
    }
  }
}
