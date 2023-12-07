import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Grid Example'),
      ),
      body: MyGrid(),
    );
  }
}

class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: 10, // Number of items in the grid
      itemBuilder: (context, index) {
        // Return the widget for each grid item
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridItem(index),
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Example background color
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }
}
