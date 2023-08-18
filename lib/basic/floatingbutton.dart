import 'package:flutter/material.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  int index = 0;
  Widget exampleOne() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index + 1;
          });
        },
        focusColor: Colors.yellow,
        focusElevation: 16.0,
        heroTag: 'add',
        elevation: 1.0,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget exampleTwo() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index + 1;
          });
        },
        focusColor: Colors.yellow,
        focusElevation: 16.0,
        heroTag: 'anything',
        elevation: 1.0,
        child: const Icon(
          Icons.text_rotation_angledown,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget exampleThree() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index + 1;
          });
        },
        focusColor: Colors.yellow,
        focusElevation: 16.0,
        heroTag: 'see',
        elevation: 1.0,
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Animated floating action button'),
      ),
      body: Center(
        child: Text(index.toString()),
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        colorEndAnimation: Colors.red,
        colorStartAnimation: Colors.blue,
        animatedIconData: AnimatedIcons.menu_close,
        fabButtons: <Widget>[exampleOne(), exampleTwo(), exampleThree()],
      ),
    );
  }
}
