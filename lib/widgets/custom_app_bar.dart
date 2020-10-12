import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  IconData icon;
  bool bottomBar;

  //constructor
  CustomAppBar(
      {this.title = 'Dashboard',
      this.icon = Icons.menu,
      this.bottomBar = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: Colors.black,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          color: Color(0xFFE7EAED),
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.infinite,
          child: Column(
            children: <Widget>[
              if (bottomBar == true)
                moneyValues()
              else
                SizedBox(
                  height: 20,
                )
            ],
          )),
      elevation: 5,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
  Widget moneyValues() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          //color: Color(0xFFE7EAED),
          child: RichText(
            text: TextSpan(
                text: '5.9',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: '\n30 Dias',
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold))
                ]),
          ),
        ),
        FlatButton(
          onPressed: () {},
          //color: Color(0xFFE7EAED),
          child: RichText(
            text: TextSpan(
                text: '1.2',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                      text: '\n24 horas',
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold))
                ]),
          ),
        ),
        FlatButton(
          onPressed: () {},
          //color: Color(0xFFE7EAED),
          child: RichText(
            text: TextSpan(
                text: '0.8',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                      text: '\nHoje',
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold))
                ]),
          ),
        )
      ],
    );
  }
}
