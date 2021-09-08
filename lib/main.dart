import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bmi version 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double weight = 20;
  double height = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI version 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: !isMale ? Colors.blueGrey : Colors.blue,
                            shadowColor: Colors.black),
                        onPressed: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.male,
                              size: 72,
                            ),
                            Text(
                              'male',
                              style: TextStyle(fontSize: 32),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: isMale ? Colors.blueGrey : Colors.blue,
                            shadowColor: Colors.black),
                        onPressed: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.female,
                              size: 72,
                            ),
                            Text(
                              'male',
                              style: TextStyle(fontSize: 32),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Column(children: [
              Text('height', style: TextStyle(fontSize: 40)),
              Text('${height.round()}', style: TextStyle(fontSize: 40)),
              Slider(
                value: height,
                onChanged: (newHeight) {
                  setState(() {
                    height = newHeight;
                  });
                },
                max: 210,
                min: 30,
              )
            ]),
          ),
          Expanded(
            child: Column(children: [
              Text('weight', style: TextStyle(fontSize: 40)),
              Text('${weight.round()}', style: TextStyle(fontSize: 40)),
              Slider(
                value: weight,
                onChanged: (newAge) {
                  setState(() {
                    weight = newAge;
                  });
                },
                max: 95,
                min: 5,
              )
            ]),
          ),
          Container(
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          isMale: isMale,
                          weight: weight,
                          height: height,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )))
        ],
      ),
    );
  }
}

class Result extends StatelessWidget {
  final bool? isMale;
  final double? weight;
  final double? height;
  Result({
    @required this.isMale,
    @required this.weight,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'gender: ${isMale! ? 'Male' : 'Female'}',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                'Height: ${height!.round()} ',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                  'Result: ${(weight! / pow(height!.round(), 2) * 10000).round()} ',
                  style: TextStyle(fontSize: 40)),
              Container(
                height: 75,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('go back'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//last commit
