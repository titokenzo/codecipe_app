import 'package:codecipe_app/data/chuvas_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:typicons_flutter/typicons.dart';

//import 'crypto_data.dart';
import 'package:codecipe_app/widgets/custom_app_bar.dart';
import 'package:codecipe_app/widgets/custom_bottom_bar.dart';

class Chuvas extends StatelessWidget {

  var dados = ChuvasData.getData;

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
                        itemCount: dados.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            //height: 70,
                            width: double.maxFinite,
                            child: Card(
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(),
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
                                                  left: 10, top: 5),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      chuvaLocal(dados[index]),
                                                      Spacer(),
                                                      chuva24(dados[index]),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
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
                          );
                        }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar()));
  }

  Widget chuvaLocal(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['local']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }

  Widget chuva24(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['last24']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 14),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['last12']}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
