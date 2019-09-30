import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  int number;
  Description(this.number):super();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(number),
    );
  }
}

class MyHomePage extends StatefulWidget {
  int number;
  MyHomePage(this.number):super();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    int carNumber = widget.number;
    final y = MediaQuery.of(context).size.height;
    final x = MediaQuery.of(context).size.width;
    return Scaffold();
  }
}
