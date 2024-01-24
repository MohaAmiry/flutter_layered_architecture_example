import '../Data/DataModels/HiveHobby.dart';

class Hobby {
  String hobbyName;
  String hobbyDesc;
  String benefits;
  int minAge;
  int hobbyIconIndex;

  Hobby(this.hobbyName, this.hobbyDesc, this.benefits, this.minAge,
      this.hobbyIconIndex);

  HiveHobby toHiveHobby() =>
      HiveHobby(hobbyName, hobbyDesc, benefits, minAge, hobbyIconIndex);
}
