import 'package:hive/hive.dart';

part 'HobbyLevels.g.dart';

// there must be a serialized object for hive hobby level, it is wrong
// to put hive object with the models.

@HiveType(typeId: 2)
enum HobbyLevel {
  @HiveField(0)
  junior,
  @HiveField(1)
  intermediate,
  @HiveField(2)
  senior
}
