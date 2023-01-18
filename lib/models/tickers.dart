import 'dart:convert';
import 'dart:ffi';

class Ticker {
  final String symbol; //"symbol": "MGLU3",
  final String shortName; //"shortName": "MAGAZ LUIZA ON      NM",
  final String longName; //"longName": "Magazine Luiza S.A.",
  final String currency; //"currency": "BRL",
  final double regularMarketPrice; //"regularMarketPrice": 3.03,
  final double regularMarketDayHigh; //"regularMarketDayHigh": 3.11,
  final double regularMarketDayLow; //"regularMarketDayLow": 2.9,
  final String regularMarketDayRange; //"regularMarketDayRange": "2.9 - 3.11",
  final double regularMarketChange; //"regularMarketChange": -0.01999998,
  final double
      regularMarketChangePercent; //"regularMarketChangePercent": -0.6557371,
  final DateTime
      regularMarketTime; //"regularMarketTime": "2023-01-11T21:07:44.000Z",
  final int marketCap; //"marketCap": 20627390464,
  final int regularMarketVolume; //"regularMarketVolume": 170364500,
  final double regularMarketPreviousClose; //"regularMarketPreviousClose": 3.05,
  final double regularMarketOpen; //"regularMarketOpen": 3.07,
  final int averageDailyVolume10Day; //"averageDailyVolume10Day": 151044755,
  final int averageDailyVolume3Month; //"averageDailyVolume3Month": 196588019,
  final double fiftyTwoWeekLowChange; //"fiftyTwoWeekLowChange": 1,
  final double
      fiftyTwoWeekLowChangePercent; //"fiftyTwoWeekLowChangePercent": 0.49261084,
  final String fiftyTwoWeekRange; //"fiftyTwoWeekRange": "2.03 - 7.38",
  final double fiftyTwoWeekHighChange; //"fiftyTwoWeekHighChange": -4.3500004,
  final double
      fiftyTwoWeekHighChangePercent; //"fiftyTwoWeekHighChangePercent": -0.5894309,
  final double fiftyTwoWeekLow; //"fiftyTwoWeekLow": 2.03,
  final double fiftyTwoWeekHigh; //"fiftyTwoWeekHigh": 7.38,
  final double twoHundredDayAverage; //"twoHundredDayAverage": 3.77985,
  final double
      twoHundredDayAverageChange; //"twoHundredDayAverageChange": -0.74985003,
  final double
      twoHundredDayAverageChangePercent; //"twoHundredDayAverageChangePercent": -0.1983809,
  final double? priceEarnings; //"priceEarnings": null,
  final double? earningsPerShare; //"earningsPerShare": -0.0554488,
  final String
      logourl; //"logourl": "https://s3-symbol-logo.tradingview.com/magaz-luiza-on-nm--big.svg"

  Ticker(
      this.symbol,
      this.shortName,
      this.longName,
      this.currency,
      this.regularMarketPrice,
      this.regularMarketDayHigh,
      this.regularMarketDayLow,
      this.regularMarketDayRange,
      this.regularMarketChange,
      this.regularMarketChangePercent,
      this.regularMarketTime,
      this.marketCap,
      this.regularMarketVolume,
      this.regularMarketPreviousClose,
      this.regularMarketOpen,
      this.averageDailyVolume10Day,
      this.averageDailyVolume3Month,
      this.fiftyTwoWeekLowChange,
      this.fiftyTwoWeekLowChangePercent,
      this.fiftyTwoWeekRange,
      this.fiftyTwoWeekHighChange,
      this.fiftyTwoWeekHighChangePercent,
      this.fiftyTwoWeekLow,
      this.fiftyTwoWeekHigh,
      this.twoHundredDayAverage,
      this.twoHundredDayAverageChange,
      this.twoHundredDayAverageChangePercent,
      this.priceEarnings,
      this.earningsPerShare,
      this.logourl);

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return json['results'].map((value) {
      return Ticker(
        value['symbol'],
        value['shortName'],
        value['longName'],
        value['currency'],
        value['regularMarketPrice'],
        value['regularMarketDayHigh'],
        value['regularMarketDayLow'],
        value['regularMarketDayRange'],
        value['regularMarketChange'],
        value['regularMarketChangePercent'],
        DateTime.parse(value['regularMarketTime']),
        value['marketCap'],
        value['regularMarketVolume'],
        value['regularMarketPreviousClose'],
        value['regularMarketOpen'],
        value['averageDailyVolume10Day'],
        value['averageDailyVolume3Month'],
        value['fiftyTwoWeekLowChange'],
        value['fiftyTwoWeekLowChangePercent'],
        value['fiftyTwoWeekRange'],
        value['fiftyTwoWeekHighChange'],
        value['fiftyTwoWeekHighChangePercent'],
        value['fiftyTwoWeekLow'],
        value['fiftyTwoWeekHigh'],
        value['twoHundredDayAverage'],
        value['twoHundredDayAverageChange'],
        value['twoHundredDayAverageChangePercent'],
        value['priceEarnings'],
        value['earningsPerShare'],
        value['logourl'],
      );
    }).first;
  }
}
