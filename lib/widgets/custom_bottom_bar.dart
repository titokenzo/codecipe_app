import 'package:codecipe/mapa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            color: Colors.pinkAccent, //set color to mock active page color
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Icons.wb_sunny),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Typicons.arrow_shuffle),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Icons.explore),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyMapa()),
              );
            },
          ),
          IconButton(
            iconSize: 30.0,
            padding: EdgeInsets.only(left: 28.0),
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {},
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}