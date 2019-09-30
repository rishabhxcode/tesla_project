import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tesla_project/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;


Route _createRoute(){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (
            BuildContext context,
            Animation animation,
            Animation  secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
                opacity: animation,
                child: child,
              ),
  );
}
  

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
Future.delayed(Duration(seconds: 5),(){
  Navigator.pushReplacement(context, _createRoute());
}
  );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Container(
            height: 300,
            width: 300,
            child: Image.asset('images/Tesla-logo.png')
          ),
        ),
      ),
    );
  }
}
