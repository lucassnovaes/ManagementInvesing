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
  Ticker? ticker;

  final _formKey = GlobalKey<FormState>();
  final _symbolController = TextEditingController();
  late Ticker insertedTicker;

  @override
  void initState() {
    super.initState();
  }

  void _getTicker(String id) async {
    TickersRepository().getDetail(id).then((value) => setState(() {
          ticker = value;
        }));
  }

  void _cleanTicker() {
    setState(() {
      ticker = null;
    });
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
                  SizedBox(height: MediaQuery.of(context).viewInsets.top),
                  TextFormField(
                      onTap: _cleanTicker,
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
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              _getTicker(_symbolController.value.text);
                            }
                          },
                          child: const Text("Buscar"))),
                  if (ticker != null)
                    TickerDatailsWidget(
                      ticker: ticker!,
                    ),
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
