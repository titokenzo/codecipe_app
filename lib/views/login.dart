import 'package:codecipe_app/views/dashboard.dart';
import 'package:flutter/material.dart';
import '../login_api.dart';


class Login extends StatelessWidget {

  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 155.0,
              child: Image.asset(
                "assets/codecipe_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            TextFormField(
              controller: _ctrlLogin,
              validator: (value){
                if(value.isEmpty){
                  return "Digite o Login";
                }
                if(value.length<3){
                  return "O campo precisa ter mais de 3 caracteres";
                }
                return null;
              },
              obscureText: false,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
              ),
              decoration: InputDecoration(
                labelText: "Login",
                hintText: "Digite o login",
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ctrlSenha,
              validator: (value){
                if(value.isEmpty){
                  return "Digite a Senha";
                }
                return null;
              },
              obscureText: true,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0
              ),
              decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "Digite a Senha",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                  )
              ),
            ),
            SizedBox(height: 10,),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                "login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                _clickButton(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }
    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;
    var response = await LoginApi.login(login,senha);
    if(response){
      _navegaHomepage(context);
    } else{
      _showAlertDialog1(context);
    }
  }
  _navegaHomepage(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(
        builder : (context)=> Dashboard()),
    );
  }

  _showAlertDialog1(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Text(
        "ATENÇÃO",
      ),
      content: Text(
          "Usuário/Senha inválido."
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}