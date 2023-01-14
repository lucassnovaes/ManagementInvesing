import 'package:managementinvesting/models/tickers.dart';
import 'package:managementinvesting/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class TickerDatailsWidget extends StatelessWidget {
  const TickerDatailsWidget({Key? key, required this.ticker}) : super(key: key);

  final Ticker ticker;

  @override
  Widget build(BuildContext context) {
    return //ListView(children: [dividerList(), dividerList()]),
        Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.query_stats),
              title: Text(ticker.symbol),
              subtitle: Text(ticker.longName),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Símbolo de negociação da ação ou empresa: ${ticker.shortName}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text('Nome completo da ação: ${ticker.longName}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text('Moeda: ${ticker.currency}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Preço de fechamento da ação: ${ticker.regularMarketPrice}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Preço mais alto negociado negociados hoje: ${ticker.regularMarketDayHigh}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Preço mais baixo negociado negociados hoje: ${ticker.regularMarketDayLow}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Faixa de preços negociados negociados hoje: ${ticker.regularMarketDayRange}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Mudança no preço da ação ou empresa desde o fechamento anterior: ${ticker.regularMarketChange}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Porcentagem de mudança no preço da ação desde o fechamento anterior: ${ticker.regularMarketChangePercent}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Horário do último fechamento da ação: ${ticker.regularMarketTime}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child:
                        Text('Capitalização de mercado: ${ticker.marketCap}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Volume negociado: ${ticker.regularMarketVolume}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Preço de fechamento anterior: ${ticker.regularMarketPreviousClose}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child:
                        Text('Preço de abertura: ${ticker.regularMarketOpen}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Volume médio diário negociado 10 dias: ${ticker.averageDailyVolume10Day}')),
                Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Text(
                        'Volume médio diário negociado 3 meses: ${ticker.averageDailyVolume3Month}')),
                //PaddingText('logourl: ${ticker.logourl}')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
