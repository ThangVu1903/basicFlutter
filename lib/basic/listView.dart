import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  //List<Photo> photoData = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  NetworkRequest.fetchPhotos()
    //      .then((dataFormServer) => {photoData = dataFormServer});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("horizontal & vertical listView "),
          backgroundColor: Colors.green[700],
          centerTitle: true),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          height: 150,
                          width: 100,
                          color: Colors.green,
                          child: Text("card$index"),
                        )),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text("list$index"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
