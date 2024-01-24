import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';

import '../../Models/AvailableHobbiesIcons.dart';
import '../../Models/Hobby.dart';
import '../AddHobbyToFavouriteView.dart';
import '../HobbyAllInfoView.dart';

class HomeSingleHobbyTile extends StatelessWidget {
  final Hobby hobby;

  const HomeSingleHobbyTile({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Hobby Name: ${hobby.hobbyName}"),
      subtitle: Text("Hobby Description: ${hobby.hobbyDesc}"),
      leading: availableHobbiesIcons.getIconByIndex(hobby.hobbyIconIndex),
      trailing: ElevatedButton(
        onPressed: () => navigateToFav(context),
        child: const Text("Add to Favourite"),
      ),
      onTap: () => navigateToHobbyInfo(context),
    );
  }

  void navigateToFav(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddHobbyToFavouriteView(hobby: hobby)));

  void navigateToHobbyInfo(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => HobbyAllInfoView(hobby: hobby)));
}
