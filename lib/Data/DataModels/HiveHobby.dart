import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../Models/Hobby.dart';
part 'HiveHobby.g.dart';

@HiveType(typeId: 0)
class HiveHobby extends HiveObject {
  @HiveField(0)
  String hobbyName;
  @HiveField(1)
  String hobbyDesc;
  @HiveField(2)
  String benefits;
  @HiveField(3)
  int minAge;
  @HiveField(4)
  int hobbyIconIndex;

  HiveHobby(this.hobbyName, this.hobbyDesc, this.benefits, this.minAge,
      this.hobbyIconIndex);

  Hobby toHobby() =>
      Hobby(hobbyName, hobbyDesc, benefits, minAge, hobbyIconIndex);
}
