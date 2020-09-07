import 'package:codecipe/chuvas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons.dart';

import 'crypto_data.dart';
import 'package:codecipe/widgets/custom_app_bar.dart';
import 'package:codecipe/widgets/custom_bottom_bar.dart';

class Dashboard extends StatelessWidget {
  var cryptoData = CryptoData.getData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Scaffold widget, de MaterialApp, provê app bar, title e body
        home: Scaffold(
            appBar: CustomAppBar(),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
// scrollDirection: Axis.horizontal,
                        itemCount: cryptoData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 100,
                            width: double.maxFinite,
                            child: Card(
                              elevation: 5,
                              child: new InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chuvas()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          width: 2.0,
                                          color: cryptoData[index]
                                              ['iconColor']),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Stack(children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        cryptoIcon(
                                                            cryptoData[index]),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        cryptoNameSymbol(
                                                            cryptoData[index]),
                                                        Spacer(),
                                                        cryptoChange(
                                                            cryptoData[index]),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        changeIcon(
                                                            cryptoData[index]),
                                                        SizedBox(
                                                          width: 20,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar()));
  }

  Widget cryptoIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            data['icon'],
            color: data['iconColor'],
            size: 40,
          )),
    );
  }

  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['symbol']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget cryptoChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['change']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['changeValue']}',
                style: TextStyle(
                    color: data['changeColor'],
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget changeIcon(data) {
    return Align(
        alignment: Alignment.topRight,
        child: data['change'].contains('-')
            ? Icon(
                Typicons.arrow_sorted_down,
                color: data['changeColor'],
                size: 30,
              )
            : Icon(
                Typicons.arrow_sorted_up,
                color: data['changeColor'],
                size: 30,
              ));
  }
}
