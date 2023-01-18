import 'package:intl/intl.dart';

String formatCurrency(String currency, double value) {
  final formatter = NumberFormat.currency(name: currency, symbol: 'R\$ ');

  return formatter.format(value);
}
