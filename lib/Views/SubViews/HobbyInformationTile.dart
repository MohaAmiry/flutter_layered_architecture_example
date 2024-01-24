import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';

import '../../Models/AvailableHobbiesIcons.dart';
import '../../Models/Hobby.dart';

class HobbyInformationTile extends StatelessWidget {
  final Hobby hobby;

  const HobbyInformationTile({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        Text("Hobby Name: ${hobby.hobbyName}"),
        Text("Hobby Description: ${hobby.hobbyDesc}"),
        Text("Hobby Benefits: ${hobby.benefits}"),
        Text("Hobby Minimum Age: ${hobby.minAge.toString()}"),
        availableHobbiesIcons.getIconByIndex(hobby.hobbyIconIndex),
      ]);
}
