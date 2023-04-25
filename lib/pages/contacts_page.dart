// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:favorite_contacts/repository/contatos_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listaContatos = ContatoRepository.contatos;
  IconData icone = Icons.favorite_border;
  Color corIcone = Colors.black;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (corIcone == Colors.black) {
        _counter = _counter + 1;
        corIcone = Colors.red;
      } else {
        _counter = _counter - 1;
        corIcone = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contatos Favoritos ' + '$_counter'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int contato) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listaContatos[contato].avatar),
                ),
                title: Text(listaContatos[contato].nome),
                subtitle: Text(listaContatos[contato].email),
                trailing: IconButton(
                  icon: Icon(
                    icone,
                    color: corIcone,
                  ),
                  onPressed: _incrementCounter,
                ),
              );
            },
            separatorBuilder: (BuildContext buildContext, int int) => Divider(),
            itemCount: listaContatos.length));
  }
}
