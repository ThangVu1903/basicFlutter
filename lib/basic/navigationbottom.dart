import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        screenRouteDetail.nameRoute: (context) => const screenRouteDetail(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, screenRouteDetail.nameRoute,
                      arguments: Person("screenDetail", "vudinhthang"));
                },
                child: const Text("button 1")),
            ElevatedButton(onPressed: () {}, child: const Text("button 2")),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(280),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ZendVN",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Studi Flutter",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class screenRouteDetail extends StatelessWidget {
  const screenRouteDetail({super.key});
  static const nameRoute = "/routeDetail";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Person;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(child: Text(args.detail)),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.contact_mail))
          ],
        ),
      ),
    );
  }
}

class Person {
  String title;
  String detail;
  Person(this.title, this.detail);
}
