import 'package:adan/LocationScreen.dart';
import 'package:adan/salat.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String receivedData =
        ModalRoute.of(context)!.settings.arguments as String;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: receivedData == 'ادان'
          ? Scaffold(
              appBar: AppBar(
                title: Text('$receivedData'),
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
                  child: Text('ادان'),
                ),
              ),
            )
          : receivedData == 'دعاء'
              ? Scaffold(
                  appBar: AppBar(
                    title: Text('$receivedData'),
                  ),
                  body: Center(
                    child: adkar(context),
                  ),
                )
              : receivedData == 'أوقات الصلاة'
                  ? Scaffold(
                      appBar: AppBar(
                        title: Text('$receivedData'),
                      ),
                      body: PrayerTimesScreen(),
                    )
                  : receivedData == 'تسبيح'
                      ? Scaffold(
                          appBar: AppBar(
                            title: Text('$receivedData'),
                          ),
                          body: tasbih(),
                        )
                      : receivedData == 'القبلة'
                          ? Scaffold(
                              appBar: AppBar(
                                title: Text('$receivedData'),
                              ),
                              body: compass(),
                            )
                          : Scaffold(
                              appBar: AppBar(
                                title: Text('$receivedData'),
                              ),
                              body: Center(
                                child: Container(),
                              ),
                            ),
    ); // You can replace this with the default behavior you want when neither condition is met
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
    ' أذكار الصباح',
    ' اذكار المساء',
    'أذكار تحصين النفس',
    'فضل آخر ساعة من يوم الجمعة',
    'أذكار يوم الجمعة',
    'فضل الصلاة على النبي في استجابة الدعاء',
    'تكبيرات العيد الحرم المكي',
    'آيات تسهيل الولادة',
    'أذكار ليلة الجمعة',
    'أذكار الصلاة',
    'كيف أستغفر الله',
    'أذكار إسلامية',
    'أذكار السفر',
    ' أذكار تجلب الرزق',
    ' أذكار بعد صلاة المغرب',
    ' التسبيح بعد كل صلاة',
    ' أذكار بعد الصلاة'
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
    return ListView.builder(
      itemCount: buttonLabels.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            // Handle button press
            Navigator.pushNamed(
              context,
              '/page3',
              arguments: buttonLabels[index],
            );
          },
          child: Text(
            buttonLabels[index],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              height: 1.5,
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
      if (fr <= adad) {
        fr++;
        indexx = indexx;
      } else {
        adad = adad + 33;
        indexx++;
      }
    } else {
      indexx = 0;
      fr = 0;
      valpro = 0.0;
      contta++;
      adad = 33;
    }
    print('${maxlist}');
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
              progressColor: Colors.blue,
              backgroundColor: Colors.transparent,
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
              child: Text('${fr}'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Transparent background color
                onPrimary: Colors.white, // Text color
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
                child: Text('${tasbih.length}'),
                // child: Icon(Icons.add),
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
        return AlertDialog(
          title: Text('Add Text'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Enter text'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasbih.add(textController.text);
                  textController.text = "";
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
