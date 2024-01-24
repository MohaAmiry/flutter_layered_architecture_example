import 'package:flutter/material.dart';

import 'Data/DataModels/HiveFavourite.dart';
import 'Data/DataModels/HiveHobby.dart';
import 'Models/Favourite.dart';
import 'Models/Hobby.dart';

extension HobbyExtension on Iterable<HiveHobby> {
  Iterable<Hobby> parseToHobby() => map((e) => e.toHobby());
}

extension FavouritesExtension on Iterable<HiveFavourite> {
  Iterable<Favourite> parseToFavourite() => map((e) => e.toFavourite());
}

extension ParseStringNumbers on String {
  int parseToInt() => int.parse(this);
}

extension GetIconByIndex on Iterable<IconData> {
  Icon getIconByIndex(int index) => Icon(elementAt(index));
}
