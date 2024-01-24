import 'package:flutter/material.dart';

import '../Models/Student.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myData = Student.getMyData();
    return Scaffold(
      appBar: AppBar(title: const Text("About Me")),
      body: Center(
        child: Column(
          children: [
            Text(myData.name),
            Text(myData.email),
            Text(myData.uniNum.toString()),
            SizedBox(width: 50, height: 50, child: myData.img)
          ],
        ),
      ),
    );
  }
}
