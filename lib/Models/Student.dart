import 'package:flutter/material.dart';

class Student {
  String name;
  int uniNum;
  String email;
  Image img;
  Student({required this.name,
    required this.uniNum,
    required this.email,
    required this.img});

  factory Student.getMyData()=>
      Student(name: "Mohammad Saleh Amiry",
          uniNum: 201820110,
          email: "m.d.b.m@hotmail.com",
          img: Image.asset("assets/a.jpeg"));

}
