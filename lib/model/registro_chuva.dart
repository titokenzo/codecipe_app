import 'package:codecipe_app/model/local.dart';

class RegistroChuva {
  final Local local;
  final DateTime data;
  final double volume;

  const RegistroChuva({this.local, this.data, this.volume});
}
