import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:managementinvesting/Models/user_model.dart';

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
      title: Text("Area Logada - Chaaaama"),
    ));
  }
}
