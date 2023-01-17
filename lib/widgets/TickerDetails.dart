import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:managementinvesting/models/tickers.dart';
import 'package:managementinvesting/utils/custom_formaters.dart';
import 'package:managementinvesting/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:managementinvesting/widgets/tickerInfo.dart';

class TickerDatailsWidget extends StatelessWidget {
  const TickerDatailsWidget({Key? key, required this.ticker}) : super(key: key);

  final Ticker ticker;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          ListTile(
              leading: SvgPicture.network(ticker.logourl),
              title: Text(ticker.symbol),
              subtitle: Text(ticker.longName),
              trailing: Text(
                  formatCurrency(ticker.currency, ticker.regularMarketPrice),
                  style: tickerPriceDecoration)),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 0, 22),
              child: Column(children: [
                TickerInfoWidget(
                    detail:
                        'Preço de fechamento: ${formatCurrency(ticker.currency, ticker.regularMarketPrice)}'),
                TickerInfoWidget(
                    detail:
                        'Preço mais alto hoje: ${formatCurrency(ticker.currency, ticker.regularMarketDayHigh)}'),
                TickerInfoWidget(
                    detail:
                        'Preço mais baixo hoje: ${formatCurrency(ticker.currency, ticker.regularMarketDayLow)}'),
                TickerInfoWidget(
                    detail:
                        'Faixa negociada hoje: ${ticker.regularMarketDayRange}'),
                TickerInfoWidget(
                    detail:
                        'Variação ultimo fechamento: ${formatCurrency(ticker.currency, ticker.regularMarketChange)}'),
                TickerInfoWidget(
                    detail:
                        'Hora fechamento : ${DateFormat.Hms().format(ticker.regularMarketTime).toString()}'),
                TickerInfoWidget(
                  detail: 'Capitalização: ${ticker.marketCap}',
                ),
                TickerInfoWidget(
                  detail: 'Volume negociado: ${ticker.regularMarketVolume}',
                ),
                TickerInfoWidget(
                    detail:
                        'Preço de fechamento anterior: ${formatCurrency(ticker.currency, ticker.regularMarketPreviousClose)}'),
                TickerInfoWidget(
                    detail:
                        'Preço de abertura: ${formatCurrency(ticker.currency, ticker.regularMarketOpen)}'),
                TickerInfoWidget(
                    detail:
                        'Volume ultimos 10 dias: ${ticker.averageDailyVolume10Day}'),
                TickerInfoWidget(
                    detail:
                        'Volume ultimos 3 meses: ${ticker.averageDailyVolume3Month}')
              ]))
        ]));
  }
}
