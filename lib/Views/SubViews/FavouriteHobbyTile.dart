import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';

import '../../Models/AvailableHobbiesIcons.dart';
import '../../Models/Favourite.dart';
import 'HobbyInformationTile.dart';

class FavouriteHobbyTile extends StatelessWidget {
  final Favourite favouriteHobby;

  const FavouriteHobbyTile({Key? key, required this.favouriteHobby})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Hobby Name: ${favouriteHobby.hobby.hobbyName}"),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hobby Start Date: ${favouriteHobby.startDate.toString()}"),
          Text("Hobby Level: ${favouriteHobby.hobbyLevel.toString()}")
        ],
      ),
      leading: availableHobbiesIcons
          .getIconByIndex(favouriteHobby.hobby.hobbyIconIndex),
      trailing: ElevatedButton(
          onPressed: () => navigateToHobby(context),
          child: const Text("Show Hobby Details")),
    );
  }

  void navigateToHobby(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar:
                    AppBar(title: const Text("Favourite Hobby Information")),
                body: Center(
                    child: HobbyInformationTile(hobby: favouriteHobby.hobby)),
              )));
}
