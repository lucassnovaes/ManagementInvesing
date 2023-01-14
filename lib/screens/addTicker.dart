import 'package:flutter/material.dart';
import 'package:managementinvesting/data/tickersRepository.dart';
import 'package:managementinvesting/models/tickers.dart';
import 'package:managementinvesting/widgets/TickerDetails.dart';

class AddTickerWidget extends StatefulWidget {
  const AddTickerWidget({Key? key}) : super(key: key);

  @override
  State<AddTickerWidget> createState() => _AddTickerFormState();
}

class _AddTickerFormState extends State<AddTickerWidget> {
  late Future<Ticker> tickersFuture;

  final _formKey = GlobalKey<FormState>();
  final _symbolController = TextEditingController();
  final _tickerRepository = TickersRepository();
  late Ticker insertedTicker;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo Monitoramento")),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      controller: _symbolController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o codigo da ação';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Codigo da ação',
                          hintText: 'Codigo Ação')),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              tickersFuture = _tickerRepository.getDetail(
                                  _symbolController.value.toString());
                            }
                          },
                          child: const Text("Buscar"))),
                  FutureBuilder<Ticker>(
                      future: tickersFuture,
                      builder: (context, snapshot) {
                        return TickerDatailsWidget(
                          ticker: snapshot.data!,
                        );
                      }),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Text("Favoritar"))))
                ],
              ))),
    );
  }
}
