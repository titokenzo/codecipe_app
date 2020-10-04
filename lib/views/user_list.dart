import 'package:codecipe/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      final users = {...DUMMY_USERS};

      return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => Text(users.values.elementAt(i).nome),
        ),
      );
    }
}