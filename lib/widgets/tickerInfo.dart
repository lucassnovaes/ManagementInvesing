import 'package:flutter/material.dart';

class TickerInfoWidget extends StatelessWidget {
  const TickerInfoWidget({Key? key, required this.detail}) : super(key: key);

  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(padding: const EdgeInsets.all(3), child: Text(detail))
    ]);
  }
}
