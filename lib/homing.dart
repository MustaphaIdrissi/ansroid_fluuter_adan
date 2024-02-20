import 'package:flutter/material.dart';
import 'package:adan/LocationScreen.dart';
import 'package:adan/Theme/colorapp.dart';
import 'package:adan/indexquran.dart';
import 'package:adan/menuleft.dart';
import 'package:adan/quran.dart';
import 'package:adan/salat.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:adan/Theme/colorapp.dart' as myColorApp;
import 'package:vibration/vibration.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorApp myColorApp = ColorApp();
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ??
            {};
    final String label = arguments['label'] ?? '';
    final int indexr = arguments['indexr'] ?? 0;
    final int receivedData = indexr;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: receivedData == 2
          ? Scaffold(
              drawer: MenuLeft(),
              appBar: AppBar(
                title: Text('$label'),
                backgroundColor: myColorApp.background,
              ),
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigate to Page 3
                    // Navigator.pushNamed(context, '/page3');
                    var url =
                        "http://api.aladhan.com/v1/calendarByCity/2023/15?city=Maroc&country=Azrou";
                    var response = await http.get(Uri.parse(url));
                    if (response.statusCode == 200) {
                      var data = json.decode(response.body);
                    }
                  },
                  child: Text('أذان'),
                ),
              ),
            )
          : receivedData == 1
              ? Scaffold(
                  drawer: MenuLeft(),
                  appBar: AppBar(
                    title: Text('$label'),
                    backgroundColor: myColorApp.background,
                  ),
                  body: Center(
                    child: adkar(context),
                  ),
                )
              : receivedData == 0
                  ? Scaffold(
                      drawer: MenuLeft(),
                      appBar: AppBar(
                        title: Text('$label'),
                        backgroundColor: myColorApp.background,
                      ),
                      body: PrayerTimesScreen(),
                    )
                  : receivedData == 4
                      ? Scaffold(
                          drawer: MenuLeft(),
                          appBar: AppBar(
                            title: Text('$label'),
                            backgroundColor: myColorApp.background,
                          ),
                          body: tasbih(),
                        )
                      : receivedData == 3
                          ? Scaffold(
                              drawer: MenuLeft(),
                              appBar: AppBar(
                                title: Text('$label'),
                                backgroundColor: myColorApp.background,
                              ),
                              body: compass(),
                            )
                          : receivedData == 5
                              ? Scaffold(
                                  drawer: MenuLeft(),
                                  appBar: AppBar(
                                    title: Text('$label'),
                                    backgroundColor: myColorApp.background,
                                  ),
                                  body: quran1(),
                                )
                              : Scaffold(
                                  drawer: MenuLeft(),
                                  appBar: AppBar(
                                    title: Text('$label'),
                                    backgroundColor: myColorApp.background,
                                  ),
                                  body: Center(
                                    child: Container(),
                                  ),
                                ),
    ); // You can replace this with the default behavior you want when neither condition is met
  }
}

class quran1 extends StatefulWidget {
  const quran1({Key? key}) : super(key: key);

  @override
  State<quran1> createState() => _quran1State();
}

class _quran1State extends State<quran1> {
  @override
  Widget build(BuildContext context) {
    return Indexquran();
  }
}

//compass

class compass extends StatefulWidget {
  const compass({Key? key}) : super(key: key);

  @override
  State<compass> createState() => _compassState();
}

class _compassState extends State<compass> {
  @override
  Widget build(BuildContext context) {
    return LocationScreen();
  }
}

//end compass

//adkare
Widget adkar(BuildContext context) {
  final List<String> itemad = [
    'أذكار الصباح',
    'أذكار المساء',
    'أذكار النوم',
    'أذكار الاستيقاظ',
    'أذكار الوضوء',
    'أذكار الشفاء',
    'أذكار بعد الصلاة',
    'أذكار للتوبة',
    'أذكار الجمعة',
    'أذكار الصلاة',
    'كيف أستغفر الله',
    'أذكار السفر',
    'أذكار الرزق'
  ];
  return Center(
    child: MyButtonList(itemad),
  );
}

class MyButtonList extends StatelessWidget {
  final List<String> buttonLabels;

  MyButtonList(this.buttonLabels);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: buttonLabels.length, // Number of items in the grid
      itemBuilder: (
        context,
        index,
      ) {
        // Return the widget for each grid item
        return ElevatedButton(
          onPressed: () {
            print(index);
            // Navigate to Page 2
            Navigator.pushNamed(
              context,
              '/page3',
              arguments: {
                'label': buttonLabels[index],
                'indexr': index,
              },
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 250.0, // Adjust the width and height as needed

            backgroundColor: myColorApp.ColorApp()
                .trans, // Set the background color to transparent
          ),
          child: Ink.image(
            image: AssetImage(
              'images/douae/ta${index}.png',
            ),
            child: Container(
              width: 160.0,
              height: 160.0,
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: myColorApp.ColorApp().background,
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: myColorApp.ColorApp().shado1, // shadow color
                      spreadRadius: 2.0, // shadow width
                      blurRadius: 1.0, // shadow blur
                      offset: Offset(0, 10), // shadow offset
                    ),
                  ],
                ),
                child: Text(
                  buttonLabels[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: myColorApp.ColorApp().Textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class tasbih extends StatefulWidget {
  const tasbih({super.key});

  @override
  State<tasbih> createState() => _tasbihState();
}

class _tasbihState extends State<tasbih> {
  TextEditingController textController = TextEditingController();
  double valpro = 0;
  int adad = 33;
  int fr = 0;
  int indexx = 0;
  int contta = 0;
  int maxlist = 0;

  int ffr() {
    fr++;
    return fr;
  }

  List tasbih = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله وحده لا شريك له له الملك وله الحمد وهو على كل شيء قدير',
  ];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    ter();
  }

  void ter() {
    maxlist = tasbih.length * 33;
    valpro = (fr / maxlist) as double;
    if (valpro < 1 && indexx < tasbih.length - 1) {
      if (fr < adad) {
        fr++;
        indexx = indexx;
      } else {
        adad = adad + 33;
        indexx++;

        Vibration.vibrate();
      }
    } else if (fr > maxlist) {
      indexx = 0;
      fr = 0;
      valpro = 0.0;
      contta++;
      adad = 33;
      Vibration.vibrate();
    }
    print('${adad}');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: AlignmentDirectional(-0.1, -0.7),
              child: Text(
                '${tasbih[indexx]}',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: CircularPercentIndicator(
              percent: valpro,
              radius: 110,
              lineWidth: 6,
              animation: true,
              animateFromLastPercent: true,
              progressColor: myColorApp.ColorApp().background,
              backgroundColor: myColorApp.ColorApp().trans,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ffr();
                });
              },
              child: Text('${fr}', style: TextStyle(fontSize: 24.0),),
              style: ElevatedButton.styleFrom(
                primary: myColorApp.ColorApp()
                    .background, // Transparent background color
                onPrimary: myColorApp.ColorApp().Textcolor, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(500.0), // Button border radius
                ),
                fixedSize: Size(200, 200),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  adts(context);
                },
                child: Icon(Icons.add),
                backgroundColor: myColorApp.ColorApp().background,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void adts(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Directionality(
      textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text('اضافة تسبيح'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'ادخل جملة تسبيح'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('الغاء'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tasbih.add(textController.text);
                    textController.text = "";
                  });
                  Navigator.of(context).pop();
                },
                child: Text('اضافة'),
              ),
            ],
          ),
        );
      },
    );
  }
}
