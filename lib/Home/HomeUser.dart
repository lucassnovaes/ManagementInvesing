import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:managementinvesting/Models/user_model.dart';

import '../Login/login_page.dart';
import '../Models/acao.dart';
import '../Repository/fallowing_repository.dart';
import '../Repository/ticker_repository.dart';
import '../Repository/users_repository.dart';
import '../screens/addTicker.dart';
import '../widgets/TickerDetails.dart';

class HomeUserPage extends StatefulWidget {
  final int userId;

  const HomeUserPage({super.key, required this.userId});

  @override
  State<HomeUserPage> createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final _repository = UsersRepository();
  final _repositoryTick = TickerRepository();
  final _usersModel = UserModel();
  List<AcaoModel> _acaoesModels = <AcaoModel>[];
  bool resultLogin = false;

  @override
  void initState() {
    wait();
    super.initState();
  }

  void wait() async {
    var result = await _repositoryTick.getTickersUsers(widget.userId);
    for (var i in result) {
      _acaoesModels.add(i);
    }
    if (_acaoesModels.length < 1) initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo!"),
      ),
      body: ListView(
        children: <Widget>[
          ButtonTheme(
            height: 60.0,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddTickerWidget(userId: widget.userId),
                    ))
              },
              child: Text('Consultar Ações'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 170, 250),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          for (var i in _acaoesModels) Text(i.acao.toString())
        ],
      ),
    );
  }
}
