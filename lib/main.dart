import 'package:flutter/material.dart';

import 'Data/HiveController.dart';
import 'Views/HomeView.dart';

void main() async {
  await HiveController.initHive(
      r"D:\Projects\Programming Projects\Flutter Projects\quizes\lib\FinalHomeWork\Data\Boxes");

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
  ));
}
