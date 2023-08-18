import 'package:basic/models/MySetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CounterProviders.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => MySettings(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDark
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.amber,
      ),
      home: const CounterHome(),
    );
  }
}

class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: context.watch<MySettings>().isDark,
              onChanged: (newValue) {
                context.read<MySettings>().isBrightness(newValue);
              })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: () => context.read<CounterProvider>().add(),
                child: const Text("nextPage")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
