import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:managementinvesting/Models/user_model.dart';

import '../Login/login_page.dart';
import '../Repository/users_repository.dart';

class HomeUserPage extends StatefulWidget {
  // final UserModel model;
  // LoginPage({required this.model});
  const HomeUserPage({super.key});

  @override
  State<HomeUserPage> createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final _repository = UsersRepository();
  final _usersModel = UserModel();
  bool resultLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo, Lucas"),
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
                      builder: (context) => CadastroUsuario(),
                    ))
              },
              child: Text('Cadastrar Novas Ações'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 170, 250),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('AMER3 | Cotação Atual: 1,05'),
          ),
          ListTile(
            title: Text('VVAR3 | Cotação Atual: 2,35'),
          ),
          ListTile(
            title: Text('TAEE11 | Cotação Atual: 39,22'),
          ),
        ],
      ),
    );
  }
}
