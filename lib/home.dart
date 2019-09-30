import 'package:flutter/material.dart';
import 'package:tesla_project/description.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int carNumber = 0;

  List<String> carName = [
    'Model-S',
    'Model-3',
    'Model-X',
    'Model-Y',
    'Roadster'
  ];
  List<String> carPicPaths = [
    "images/tesla/model-s.png",
    "images/tesla/model-3.png",
    "images/tesla/model-x.png",
    "images/tesla/model-y.png",
    "images/tesla/roadster.png"
  ];
  List<String> Range = ['370 mi', '310 mi', '325 mi', '300 mi', '620 mi'];

  List<String> xlr8 = [
    '0-60 mph in 2.4s',
    '0-60 mph in 3.2s',
    '0-60 mph in 2.7s',
    '0-60 mph in 3.5s',
    '0-60 mph in 1.9s'
  ];
  List<String> speed = ['163 mph', '162 mph', '155 mph', '150 mph', '250  mph'];

  List<String> specialFeature = ['30 cu ft', 'AWD', '7', 'AWD', 'SuperCar'];
  List<String> specialheading = [
    'Best in Class storage',
    'Dual Motor',
    'Room for seven',
    'Dual Motor',
    'Performance'
  ];

  int carindex = 0;
  double opacity = 1.0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1.0, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final y = MediaQuery.of(context).size.height;
    final x = MediaQuery.of(context).size.width;

    Widget carCard(int index) {
      return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - index;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 5.0);
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        carName[index],
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontFamily: 'Raleway',
                            fontSize: Curves.easeInQuart.transform(value) * 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Curves.easeInQuart.transform(value) * y / 3,
                  width: Curves.easeInQuart.transform(value) * 250,
                  child: widget,
                ),
              ],
            ),
          );
        },
        child: Container(
          height: y / 2,
          width: x,
          alignment: Alignment.center,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(carPicPaths[index])),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(null, 50),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black87,
          child: Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: y / 12,
              child: Image.asset(
                'images/tesla_logo2.png',
                fit: BoxFit.contain,
              )),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: y / 2.25,
              color: Colors.transparent,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return carCard(index);
                },
                onPageChanged: (index) {
                  setState(() {
                    carNumber = index;
                    opacity = 0.0;
                    Future.delayed(const Duration(milliseconds: 700), () {
                      setState(() {
                        opacity = 1.0;
                        carindex = index;
                      });
                    });
                  });
                },
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: x/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      /***********************RANGE************************/
                        AnimatedOpacity(
                            opacity: opacity,
                            duration: Duration(milliseconds: 400),
                            child: Text(
                              Range[carindex],
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            )),
                      Text(
                        'Range (EPA est.)',
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  ),
                ),
                Container(
                  height: y / 10,
                  child: VerticalDivider(
                    color: Colors.red,
                    width: x/7,
                    thickness: 1,
                  ),
                ),
                Container(
                  width: x/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                          AnimatedOpacity(
                            opacity: opacity,
                            duration: Duration(milliseconds: 200),
                                                      child: Text(
                              '${specialFeature[carindex]}',
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                      AnimatedOpacity(
                        opacity: opacity,
                            duration: Duration(milliseconds: 700),
                                              child: Text(
                          '${specialheading[carindex]}',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: y / 30,
          ),
          Container(
            alignment: Alignment.center,
            height: y / 16,
            width: x / 1.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Accleration: ',
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    Text('Top speed: ',
                        style: TextStyle(color: Colors.grey.shade400)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedOpacity(
                      opacity: opacity,
                            duration: Duration(milliseconds: 300),
                                          child: Text(
                        '${xlr8[carindex]}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    AnimatedOpacity(
                       opacity: opacity,
                            duration: Duration(milliseconds: 600),
                                          child: Text(
                        '${speed[carindex]}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: y / 20,
          ),
          Container(
            height: y / 15,
            width: x / 1.75,
            child: OutlineButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Description(carNumber)),
                );
              },
              highlightedBorderColor: Colors.red,
              borderSide: BorderSide(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 2.0,
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text(
                'Order Now',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
