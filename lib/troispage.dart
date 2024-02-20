import 'dart:ffi';

import 'package:adan/menuleft.dart';
import 'package:flutter/material.dart';
import 'package:adan/Theme/colorapp.dart' as myColorApp;
import 'doae.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
            {};
    final String label = arguments['label'] ?? '';
    final int indexr = arguments['indexr'] ?? 0;
    final int receivedData = indexr;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MenuLeft(),
        appBar: AppBar(
          title: Text('$label'),
          backgroundColor: myColorApp.ColorApp().background,
        ),
        body: Container(
          color: myColorApp.ColorApp().background,
          child: ListView.builder(
              itemCount: getListByReceivedData(receivedData).length,
              itemBuilder: (context, index) {
                return Testing(
                  doae: getListByReceivedData(receivedData)[index].doae,
                  rept: getListByReceivedData(receivedData)[index].rept,
                  index: index,
                );
              }),
        ),
      ),
    );
  }

  List<Douae> getListByReceivedData(int receivedData) {
    switch (receivedData) {
      case 0:
        return doaegroup;
      case 1:
        return doaegroup1;
      case 2:
        return doaegroup2;
      case 3:
        return doaegroup3;
      case 4:
        return doaegroup4;
      case 5:
        return doaegroup5;
      case 6:
        return doaegroup6;
      case 7:
        return doaegroup7;
      case 8:
        return doaegroup8;
      case 9:
        return doaegroup9;
      case 10:
        return doaegroup10;
      case 11:
        return doaegroup11;
      case 12:
        return doaegroup12;
      // Add more cases as needed

      // Default case (return an empty list)
      default:
        return [];
    }
  }
}

class Testing extends StatefulWidget {
  final int index;
  final String doae;
  final int rept;
  const Testing({
    Key? key,
    required this.doae,
    required this.rept,
    required this.index,
  }) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  int totalRep = 0;

  @override
  void initState() {
    super.initState();
    totalRep = widget.rept;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: myColorApp.ColorApp().trans,
      ),
      onPressed: () {
        setState(() {
          // Modifying the state within the callback
          if (totalRep > 0) {
            totalRep--;
          } else {}
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: myColorApp.ColorApp().Textcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19.0),
                bottomRight: Radius.circular(19.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: myColorApp.ColorApp().shado1,
                  spreadRadius: 7, // Spread radius
                  blurRadius: 7,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 200 - 50,
                  alignment: Alignment.center,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        textDirection: TextDirection.rtl,
                        widget.doae,
                        style: TextStyle(
                          // backgroundColor: Colors.yellow,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: myColorApp.ColorApp().Textcolor2,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: myColorApp.ColorApp().background,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(19.0),
                      bottomRight: Radius.circular(19.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: myColorApp.ColorApp().shado1,
                        spreadRadius: 7, // Spread radius
                        blurRadius: 7,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // Adjust as needed

                    children: [
                      Text(
                        'تكرار',
                        style: TextStyle(
                          color: myColorApp.ColorApp().Textcolor2,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'font1',
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: myColorApp.ColorApp().Textcolor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            '$totalRep',
                            style: TextStyle(
                              color: myColorApp.ColorApp().Textcolor2,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'font1',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'مشاركة',
                        style: TextStyle(
                          color: myColorApp.ColorApp().Textcolor2,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'font1',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
