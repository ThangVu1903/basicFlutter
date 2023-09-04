import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExIsolate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExIsolate extends StatefulWidget {
  const ExIsolate({super.key});

  @override
  State<ExIsolate> createState() => _ExIsolateState();
}

class _ExIsolateState extends State<ExIsolate> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            imageRotate(animation: animation),
            ElevatedButton(
                onPressed: () {
                  creatNewIsolate();
                },
                child: const Text("click"))
          ],
        ),
      ),
    );
  }

  void creatNewIsolate() {
    // main isolate
    var receivePort = ReceivePort();
    Isolate.spawn(taskRunner, receivePort.sendPort);
    //entrypoint là static function , 2 là top function(ngang cấp với main)
    receivePort.listen((message) {
      // nhận được list senport từ newIsolate
      print(message[0]);
      message[1]
          .send("from main isolate"); // dùng sen gửi lại cho newisolate message
    });
  }

  static void taskRunner(SendPort sendPort) {
    var receivePort =
        ReceivePort(); // tạo receivePort để nhận sen từ main isolate
    receivePort.listen((message) {
      print(message);
    });
    //newisolate
    var tatal = 0;
    for (var i = 0; i < 1000000000; i++) {
      tatal += i;
    }
    sendPort.send([
      tatal,
      receivePort.sendPort
    ]); //newIsolate gửi cho mainIsolate list các senport
  }
}

class imageRotate extends StatelessWidget {
  const imageRotate({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: const Padding(
          padding: EdgeInsets.all(20),
          child: Image(
            image: AssetImage("./asset/images/pngwing.png"),
            height: 100,
            width: 100,
          )),
    );
  }
}
