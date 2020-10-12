import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi{
  static Future<bool> login(String user, String password) async {
    var url ='http://tecnologiasinternet.com.br/apac/login.php';
    var header = {"Content-Type" : "application/json"};
    Map params = {
      "login" : user,
      "senha" : password,
    };
    var _body = json.encode(params);
    var response = await http.post(url, headers:header, body: _body);
    Map mapResponse = json.decode(response.body);
    return mapResponse["logado"];
  }
}