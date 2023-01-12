import 'package:flutter/material.dart';
import 'package:managementinvesting/data/tickersRepository.dart';
import 'package:managementinvesting/models/tickers.dart';

class AddTickerWidget extends StatefulWidget {
  const AddTickerWidget({Key? key}) : super(key: key);

  @override
  State<AddTickerWidget> createState() => _AddTickerFormState();
}

class _AddTickerFormState extends State<AddTickerWidget> {
  late Future<Ticker> tickersFuture;

  final _formKey = GlobalKey<FormState>();
  final _tickerController = TextEditingController();
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
                      controller: _tickerController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira o codigo da ação';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Ticker', hintText: 'Codigo Ação')),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              tickersFuture = _tickerRepository.getDetail(
                                  _tickerController.value.toString());
                            }
                          },
                          child: const Text("Buscar"))),
                  FutureBuilder<Ticker>(
                      future: tickersFuture,
                      builder: (context, snapshot) {
                        return Padding(padding: const EdgeInsets.only(top: 8));
                      }),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // final language = Language(
                              //     _tickerController.text,
                              //     _descriptionController.text,
                              //     _imageController.text);
                              // Navigator.pop(context, language);
                            }
                          },
                          child: const Text("Adicionar")))
                ],
              ))),
    );
  }
}
