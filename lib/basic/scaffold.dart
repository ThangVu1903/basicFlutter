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
    final Size size = MediaQuery.of(context).size;
    int count = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar'),
      ),
      body: Container(
        child: Text('$count'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (int indexOfItem) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Center(
                child: Text(
                  'home',
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
              ),
            ),
            ListTile(
              title: Text('about'),
            ),
            ListTile(
              title: Text('help'),
            )
          ],
        ),
      ),
    );
  }
}
