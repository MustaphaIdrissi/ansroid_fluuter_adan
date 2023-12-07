import 'package:flutter/material.dart';
import '../troispage.dart';
import '../homing.dart';

void main() {
  runApp(MaterialApp(
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

  get icon => null;

  ElevatedButton buildButton(
      BuildContext context, final int index, String name, String liimag) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to Page 2
        Navigator.pushNamed(
          context,
          '/page2',
          arguments: name,
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 250.0, // Adjust the width and height as needed

        backgroundColor:
            Colors.transparent, // Set the background color to transparent
      ),
      child: Ink.image(
        image: AssetImage(
          'images/$liimag',
        ),
        child: Container(
          width: 160.0, // Adjust the width and height as needed
          height: 160.0,
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 230, 11, 11),
            child: Text(
              '$name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
      'ادان',
      'صلاة',
      'دعاء',
      'القبلة',
      'تسبيح',
      '2تسبيح'
    ];
    final List<String> itemimg = [
      'adan1.png',
      'adan2.png',
      'adan3.png',
      'adan4.png',
      'adan5.png',
      'adan6.png'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
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
            child: buildButton(context, index, itemList[index], itemimg[index]),
          );
        },
      ),
    );
  }
}
