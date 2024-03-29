import 'package:adan/Theme/colorapp.dart' as myColorApp;
import 'package:adan/menuleft.dart';
import 'package:flutter/material.dart';

import '../troispage.dart';
import '../homing.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Adanexemple(),
      '/page2': (context) => Page2(),
      '/page3': (context) => Page3(),
    },
  ));
}

class Adanexemple extends StatelessWidget {
  const Adanexemple({super.key});

  get icon => 'fffff';

  ElevatedButton buildButton(
      BuildContext context, final int index, String name, String liimag) {
    return ElevatedButton(
      onPressed: () {
      
        // Navigate to Page 2
        Navigator.pushNamed(
          context,
          '/page2',
          arguments: {
            'label': name,
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
          'images/$liimag',
        ),
        child: Container(
          width: 160.0,
          height: 160.0,
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColorApp.ColorApp().background,
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
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
              '$name',
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
  }

  @override
  Widget build(BuildContext context) {
    final List<String> itemList = [
      'مواقيت الصلاة',
      'الأدعية',
      'أذان',
      'القبلة الصلاة',
      'المسبحة',
      'القرأن الكريم'
    ];
    final List<String> itemimg = [
      'adan6.png',
      'adan3.png',
      'adan1.png',
      'adan4.png',
      'adan5.png',
      'adan2.png'
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تطبيق اسلامي',
            style: TextStyle(
              fontFamily: 'font2',
              fontSize: 24,
            ),
          ),
          backgroundColor: myColorApp.ColorApp().background,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemCount: itemList.length, // Number of items in the grid
          itemBuilder: (
            context,
            index,
          ) {
            // Return the widget for each grid item
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  buildButton(context, index, itemList[index], itemimg[index]),
            );
          },
        ),
        drawer: MenuLeft(),
      ),
    );
  }
}
