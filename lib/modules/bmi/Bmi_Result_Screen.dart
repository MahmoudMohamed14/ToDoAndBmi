import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  bool isMale;
  var result;
  var age;

  BmiResult({@ required this.isMale, @ required this.result, @ required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

          Text('Gender : ${isMale?'Male':'Female'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          Text('Result :${result.round()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          Text('Age : $age',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),

        ],
        ),
      ),
    );
  }
}
