import '../Data/DataModels/HiveFavourite.dart';
import 'Hobby.dart';
import 'HobbyLevels.dart';

class Favourite {
  Hobby hobby;
  HobbyLevel hobbyLevel;
  DateTime startDate;

  Favourite(this.hobby, this.hobbyLevel, this.startDate);

  HiveFavourite toHiveFavourite() =>
      HiveFavourite(hobby.toHiveHobby(), hobbyLevel, startDate);
}
