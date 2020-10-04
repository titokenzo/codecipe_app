import 'package:codecipe/model/local.dart';

class RegistroChuva {
  final Local local;
  final DateTime data;
  final double volume;

  const RegistroChuva({this.local, this.data, this.volume});
}
