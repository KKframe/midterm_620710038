import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: Pig(),
    );
  }
}

class Pig extends StatelessWidget {
  Pig({Key? key}) : super(key: key);
  final lengthController = TextEditingController();
  final girthController = TextEditingController(); //ตั้งตัวแปรระดับคลาส
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'PIG WEIGHT ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                ),
              ),
              Text(
                'CALCULATOR',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pink, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/pig.png',
                  height: 180.0,
                ),
              ),
              Row(
                children: [
                  buildExpandedLength(),
                  buildExpandedGirth(),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          //โค้ดที่จะทำงานเมื่อกดปุ่ม
                          var l = lengthController.text;
                          var g = girthController.text;
                          double? length = double.tryParse(l);
                          double? girth = double.tryParse(g);
                          if(length==null || girth==null){
                            showDialog(context: context,  barrierDismissible: false,builder: (BuildContext context){
                              return AlertDialog(
                                title: Text('ERROR'),
                                content:Text('Invalid input'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                          }else{
                            var weight = (girth/100)*(girth/100)*(length/100)*69.3;
                            //print(weight)
                            var price = 112.50 * weight;
                            var minW = 0.97 * weight;
                            var maxW = 1.03 * weight;
                            var minPrice = 0.97*price;
                            var maxPrice = 1.03*price;
                            showDialog(context: context,  barrierDismissible: false,builder: (BuildContext context){
                              return AlertDialog(
                                title: Row(
                                  children: [
                                    Image.asset('assets/images/ic_pig.png',height: 30,),
                                    Text('RESULT'),
                                  ],
                                ),
                                content:Text('Weight : ${minW.round()} - ${maxW.round()} kg \nPrice : ${minPrice.round()} - ${maxPrice.round()} Baht'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                          }
                        },
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpandedGirth() {
    return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(2.0, 5.0), //ทิศทางของเงา,
                                blurRadius: 5.0,
                                spreadRadius: 2.0)
                          ]
                        //border: Border.all(width: 5.0, color: Colors.blue),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'GIRTH',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '(CM)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:6.0,bottom: 6.0),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: girthController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter girth',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                );
  }

  Expanded buildExpandedLength() {

    return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(2.0, 5.0), //ทิศทางของเงา,
                                blurRadius: 5.0,
                                spreadRadius: 2.0)
                          ]
                        //border: Border.all(width: 5.0, color: Colors.blue),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'LENGTH',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '(CM)',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: lengthController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter weight',
                                ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
  }
}
