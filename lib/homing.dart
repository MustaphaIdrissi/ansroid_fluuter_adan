// page2.dart
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String receivedData =
        ModalRoute.of(context)!.settings.arguments as String;

    return receivedData == 'ادان'
        ? Scaffold(
            appBar: AppBar(
              title: Text('$receivedData'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Page 3
                  Navigator.pushNamed(context, '/page3');
                },
                child: Text('ادان'),
              ),
            ),
          )
        : receivedData == 'صلاة'
            ? Scaffold(
                appBar: AppBar(
                  title: Text('$receivedData'),
                ),
                body: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Page 3
                    Navigator.pushNamed(context, '/page3');
                  },
                  child: Text('صلاة'),
                )),
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
                : Scaffold(
                    appBar: AppBar(
                      title: Text('$receivedData'),
                    ),
                    body: Center(
                      child: Container(),
                    ),
                  ); // You can replace this with the default behavior you want when neither condition is met
  }
}

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
