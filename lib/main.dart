
import 'package:flutter/material.dart';
import 'package:learn/modules/bmi/Bmi_Screen.dart';
import 'package:learn/modules/tasks_screen/tasks_screen.dart';

import 'layouts/home_layout.dart';

void main() {
  runApp(Test());
}
class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:HomeLayout(),
    );
  }
}
