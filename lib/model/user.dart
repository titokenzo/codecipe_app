import 'package:flutter/material.dart';

class User{
  final String id;
  final String nome;
  final String login;
  final String email;
  final String pass;

  const User({
    this.id,
    @required this.nome,
    @required this.login,
    this.email,
    this.pass
  });
}