import 'package:flutter/material.dart';

import 'doae.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String receivedData =
        ModalRoute.of(context)!.settings.arguments as String;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('$receivedData'),
        ),
        body: ListView.builder(
            itemCount: getListByReceivedData(receivedData).length,
            itemBuilder: (context, index) {
              return Testing(
                doae: getListByReceivedData(receivedData)[index].doae,
                rept: getListByReceivedData(receivedData)[index].rept,
                index: index,
              );
            }),
      ),
    );
  }

  List<Douae> getListByReceivedData(String receivedData) {
    switch (receivedData) {
      case ' أذكار الصباح':
        return doaegroup;
      case ' اذكار المساء':
        return doaegroup1;
      case ' أذكار بعد الصلاة':
        return doaegroup16;
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
      onPressed: () {
        setState(() {
          // Modifying the state within the callback
          if (totalRep > 1) {
            totalRep--;
          } else {
            print('totalRep is already zero!');
          }
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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19.0),
                bottomRight: Radius.circular(19.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
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
                          color: Colors.black,
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
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(19.0),
                      bottomRight: Radius.circular(19.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
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
                      Text('مشاركة'),
                      Text('$totalRep'),
                      Text('تكرار'),
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
