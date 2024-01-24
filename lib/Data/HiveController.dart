import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';
import 'package:hive/hive.dart';

import '../Models/Favourite.dart';
import '../Models/Hobby.dart';
import '../Models/HobbyLevels.dart';
import 'DataModels/HiveFavourite.dart';
import 'DataModels/HiveHobby.dart';
import 'HiveBoxes.dart';

class HiveController {
  static Future<void> initHive(String path) async {
    Hive.init(path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HobbyLevelAdapter());
      Hive.registerAdapter(HiveFavouriteAdapter());
      Hive.registerAdapter(HiveHobbyAdapter());
      (await getHobbies()).isEmpty ? await _addDefaultHobbies() : null;
    }
  }

  static Future<void> addHobby(Hobby hobby) async =>
      await (await _getHobbyBox()).add(hobby.toHiveHobby());

  static Future<Iterable<Hobby>> getHobbies() async =>
      (await _getHobbyBox()).values.parseToHobby();

  static Future<Iterable<Favourite>> getFavourites() async =>
      (await _getFavouriteBox()).values.parseToFavourite();

  static Future<void> addHobbyToFavorite(Favourite favouriteHobby) async =>
      (await _getFavouriteBox()).add(favouriteHobby.toHiveFavourite());

  // internal functions
  static Future<Box<HiveHobby>> _getHobbyBox() async =>
      await Hive.openBox<HiveHobby>(hobbyBox);

  static Future<Box<HiveFavourite>> _getFavouriteBox() async =>
      await Hive.openBox<HiveFavourite>(favouriteBox);

  static Future<void> _addDefaultHobbies() async {
    await addHobby(
        Hobby("Swimming", "Swim Around", "Benefit1, Benefit2", 7, 0));
    await addHobby(
        Hobby("Football", "Knock Ball", "Benefit3 , Benefit4", 10, 1));
  }
}
