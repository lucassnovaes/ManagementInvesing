import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:managementinvesting/models/tickers.dart';

class TickersRepository {
  final String mock =
      '{"results": [{"symbol":"MGLU3","shortName":"MAGAZLUIZAONNM","longName":"MagazineLuizaS.A.","currency":"BRL","regularMarketPrice":3.43,"regularMarketDayHigh":3.62,"regularMarketDayLow":3.09,"regularMarketDayRange":"3.09-3.62","regularMarketChange":0.24000001,"regularMarketChangePercent":7.5235114,"regularMarketTime":"2023-01-13T21:07:34.000Z","marketCap":22902863872,"regularMarketVolume":315639000,"regularMarketPreviousClose":3.19,"regularMarketOpen":3.16,"averageDailyVolume10Day":176479066,"averageDailyVolume3Month":199448109,"fiftyTwoWeekLowChange":1.4000001,"fiftyTwoWeekLowChangePercent":0.68965524,"fiftyTwoWeekRange":"2.03-7.38","fiftyTwoWeekHighChange":-3.95,"fiftyTwoWeekHighChangePercent":-0.53523034,"fiftyTwoWeekLow":2.03,"fiftyTwoWeekHigh":7.38,"twoHundredDayAverage":3.74505,"twoHundredDayAverageChange":-0.3150499,"twoHundredDayAverageChangePercent":-0.08412435,"validRanges":["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"],"historicalDataPrice":[{"date":1673644054,"open":3.1600000858306885,"high":3.619999885559082,"low":3.0899999141693115,"close":3.430000066757202,"volume":315639000}],"priceEarnings":null,"earningsPerShare":-0.0554488,"logourl":"https://s3-symbol-logo.tradingview.com/magaz-luiza-on-nm--big.svg"}]}';
  Future<Ticker> getDetail(String symbol) async {
    // final response =
    //     await http.get(Uri.parse('https://brapi.dev/api/quote/${symbol}'));

    // if (response.statusCode != 200) {
    //   throw Exception('Não foi possivel listar ações');
    // }

    //return (Ticker.fromJson(jsonDecode(response.body)) as List).first;
    return Ticker.fromJson(jsonDecode(mock));
  }
}
