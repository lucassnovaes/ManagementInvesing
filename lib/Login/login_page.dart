import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:managementinvesting/Home/HomeUser.dart';
import 'package:managementinvesting/Models/user_model.dart';

import '../Repository/users_repository.dart';

class LoginPage extends StatefulWidget {
  // final UserModel model;
  // LoginPage({required this.model});
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final _repository = UsersRepository();
  final _usersModel = UserModel();
  int resultLogin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    autofocus: true,
                    controller: _usuario,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Usuario",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    autofocus: true,
                    controller: _senha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () async => {
                      _usersModel.user = _usuario.text,
                      _usersModel.password = _senha.text,
                      resultLogin = await _repository.getUserLogin(_usersModel),
                      if (resultLogin > 0)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeUserPage(userId: resultLogin),
                              ))
                        }
                      else
                        {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('ATENÇÃO'),
                              content: const Text('Usuario ou senha invalidos'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          )
                        }
                    },
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 32, 170, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Divider(),
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
                    child: Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 32, 170, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CadastroUsuario extends StatelessWidget {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _nome = TextEditingController();

  final _repository = UsersRepository();
  final _usersModel = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de usuário"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: _nome,
                    autofocus: false,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Nome Completo",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    controller: _email,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    controller: _usuario,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Usuário",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                TextField(
                    controller: _senha,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () => {
                      _usersModel.name = _nome.text,
                      _usersModel.email = _email.text,
                      _usersModel.user = _usuario.text,
                      _usersModel.password = _senha.text,
                      _repository.create(_usersModel),
                      // _repository.getContacts()
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                    },
                    child: Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 32, 170, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
