import 'package:hive/hive.dart';

import '../../Models/Favourite.dart';
import '../../Models/Hobby.dart';
import '../../Models/HobbyLevels.dart';
import 'HiveHobby.dart';

part 'HiveFavourite.g.dart';

@HiveType(typeId: 1)
class HiveFavourite extends HiveObject {
  @HiveField(0)
  HiveHobby hobby;
  @HiveField(1)
  HobbyLevel hobbyLevel;
  @HiveField(2)
  DateTime startDate;

  HiveFavourite(this.hobby, this.hobbyLevel, this.startDate);

  Favourite toFavourite() => Favourite(hobby.toHobby(), hobbyLevel, startDate);
}
