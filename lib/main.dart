import 'dart:convert';

import 'package:assignment_gulshan/utils.dart';
import 'package:flutter/material.dart';

import 'Car.dart';
import 'JsonData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Claims',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(title: 'My Claims'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Car> allClaims = <Car>[];

  @override
  void initState() {
    fetchClaims().then((value) => {
      setState(() {
        allClaims.addAll(value);
      })
    });
    super.initState();
  }

  Future<List<Car>> fetchClaims() async {
    // imitating the API behavior
    var response = await JsonSource.source;
    var claims = <Car>[];
    var claimsJson = json.decode(response);
    for (var unitJson in claimsJson['cars']) {
      claims.add(Car.fromJson(unitJson));
    }
    return claims;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
        ),
        body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 245, 247, 252),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      "Click each card to view more details",
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                        child: ListView.builder(
                            itemCount: allClaims.length,
                            itemBuilder: (context, index) {
                              return CustomViews().singleItem(allClaims[index]);
                            }),
                      ))
                ],
              ),
            )));
  }
}
