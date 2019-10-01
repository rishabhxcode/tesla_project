import 'package:flutter/material.dart';
import 'package:tesla_project/home.dart';

class Description extends StatelessWidget {
  int number;
  Description(this.number) : super();
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
  MyHomePage(this.number) : super();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> acc = ['2.4s', '3.2s', '2.7s', '3.5s', '1.9s'];
  List<String> speed = ['163mph', '162mph', '155mph', '150mph', '250mph'];
  List<String> des = [];
  List<String> pricePer = ['90,115', '47,315', '95,315', '56,700', '250,000'];
  List<String> priceLong = ['70,115', '39,315', '75,315', '47,700', '200,000'];
  List<String> imageURL = [
    'https://st.motortrend.com/uploads/sites/10/2015/11/2013-tesla-model-s-sedan-angular-front.png',
    'https://www.tesla.com/content/dam/tesla-site/sx-redesign/img/model3-proto/specs/compare-model3--right.png',
    'https://purepng.com/public/uploads/large/tesla-model-x-hnj.png',
    'https://crdms.images.consumerreports.org/c_lfill,w_720,q_auto,f_auto/prod/cars/cr/model-years/10173-2020-tesla-model-y',
    'https://crdms.images.consumerreports.org/c_lfill,w_720,q_auto,f_auto/prod/cars/cr/model-years/9120-2020-tesla-roadster'
  ];

  bool perFlag = true;
  bool longFlag = false;
  double op1 = 1.0;
  double op2 = 0.3;
  @override
  Widget build(BuildContext context) {
    int carNumber = widget.number;
    final y = MediaQuery.of(context).size.height;
    final x = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size(null, 50),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 2,
                top: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                height: 40,
                width: 140,
                child: Image.asset(
                  'images/Tesla_logo_grey.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(children: <Widget>[
                  Container(
                    height: y/3,
                    child: Image.network('${imageURL[carNumber]}', fit: BoxFit.cover,),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /**************Performance Price****************/
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            setState(() {
                             if(op1 == 0.3){
                               op1 =1.0;
                               op2 = 0.3;
                               perFlag = true;
                               longFlag = false;
                             } 
                            });

                          },
                            child: AnimatedOpacity(
                            opacity: op1,
                            duration: Duration(milliseconds: 500),
                              child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('\$${pricePer[carNumber]}', style: TextStyle(fontSize: 30, color: Colors.green.shade900),),
                                  Text('Performance', style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold,),),
                                ],
                              )
                              ),
                          ),
                        ),
                        /****************Long Range Price**********************/
                        InkWell(
                           highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            setState(() {
                             if(op2 == 0.3){
                               op2 = 1.0;
                               op1 = 0.3;
                               longFlag = true;
                               perFlag = false;
                             } 
                            });
                          },
                                                  child: AnimatedOpacity(
                            opacity: op2,
                            duration: Duration(milliseconds: 500),
                              child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('\$${priceLong[carNumber]}',style: TextStyle(fontSize: 30,color: Colors.green.shade900),),
                                  Text('Long Range',style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],)
                    ),
                  )
                ],                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75), topRight: Radius.circular(75)),
              child: Material(
                elevation: 10.0,
                child: Container(
                  height: y / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                          topRight: Radius.circular(75)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            width: x / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  '${acc[carNumber]}',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text('0-60 mph'),
                              ],
                            ),
                          ),
                          Container(
                            height: y / 15,
                            child: VerticalDivider(
                              width: 2.0,
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: x / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${speed[carNumber]}',
                                    style: TextStyle(fontSize: 30)),
                                Text('Top Speed')
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          'Description',
                          style: TextStyle(fontSize: 26, fontFamily: 'Raleway'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: (perFlag == true)
                            ?Text('\$${pricePer[carNumber]}',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),)
                            :Text('\$${priceLong[carNumber]}',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),),
                            ),
                          Container(
                            width: 120,
                            height: 46,
                            child: OutlineButton(
                              color: Colors.grey,
                              onPressed: () {},
                              highlightedBorderColor: Colors.red,
                              borderSide: BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
