import 'package:codecipe/model/municipio.dart';
import 'package:flutter/material.dart';

class Local {
  final String id;
  final Municipio municipio;
  final String nome;

  const Local({
    this.id,
    this.municipio,
    this.nome,
  });
}
