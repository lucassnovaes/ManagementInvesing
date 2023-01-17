import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:managementinvesting/models/tickers.dart';

class TickersClient {
  Future<Ticker> getDetail(String symbol) async {
    final response = await http.get(Uri.parse(
        'https://brapi.dev/api/quote/$symbol?range=1d&interval=1d&fundamental=false'));

    if (response.statusCode != 200) {
      throw Exception('Não foi possivel listar ações');
    }

    return Ticker.fromJson(jsonDecode(response.body));
  }
}
