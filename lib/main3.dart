import 'package:flutter/material.dart';
import 'apicall.dart';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var url;
  var data;

  String queryText = 'Query';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PYTHON AND FLUTTER'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  url = Uri.parse('http://10.0.2.2:5000/api?Username=$value&Password=$value');
                },
                decoration: InputDecoration(
                    hintText: 'Search Anything Here',
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          data = await getdata(url);
                          print(data);
                          dynamic decodedData = jsonDecode(jsonDecode(jsonEncode(data)));
                          print(decodedData.runtimeType);

                          setState(() {
                            queryText = decodedData['Username'] + decodedData['Password'] ;
                          });
                        },
                        child: const Icon(Icons.search))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                queryText,
                style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}