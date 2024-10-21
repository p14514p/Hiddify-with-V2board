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
  
    if (response == null || response['data'] == null) {
      return [];
    }
  
    return (response['data'] as List).map((paymentMethod) {
      return {
        "id": paymentMethod['id'],
        "name": paymentMethod['name'],
        "payment": paymentMethod['payment'],
        "icon": paymentMethod['icon'] ?? 'default_icon_url',  // 设置默认图标
        "handling_fee_fixed": paymentMethod['handling_fee_fixed'] ?? 0.0,  // 设置默认的固定手续费
        "handling_fee_percent": paymentMethod['handling_fee_percent'] ?? 0.0,  // 设置默认的百分比手续费
      };
    }).toList();
  }
}
