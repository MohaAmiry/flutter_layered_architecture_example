import 'package:flutter/material.dart';

import '../../Models/HobbyLevels.dart';

class HobbyLevelSelect extends StatefulWidget {
  final Function changeSelectionFunc;

  const HobbyLevelSelect({Key? key, required this.changeSelectionFunc})
      : super(key: key);

  @override
  State<HobbyLevelSelect> createState() => HobbyLevelSelectState();
}

class HobbyLevelSelectState extends State<HobbyLevelSelect> {
  HobbyLevel internalSelectedHobbyLevel = HobbyLevel.junior;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
              value: HobbyLevel.junior,
              title: Text("Level 1: ${HobbyLevel.junior.name}"),
              groupValue: internalSelectedHobbyLevel,
              onChanged: (value) => applyChangesToParentAndChild(value!)),
          RadioListTile(
              value: HobbyLevel.intermediate,
              title: Text("Level 2: ${HobbyLevel.intermediate.name}"),
              groupValue: internalSelectedHobbyLevel,
              onChanged: (value) => applyChangesToParentAndChild(value!)),
          RadioListTile(
              value: HobbyLevel.senior,
              title: Text("Level 3: ${HobbyLevel.senior.name}"),
              groupValue: internalSelectedHobbyLevel,
              onChanged: (value) => applyChangesToParentAndChild(value!))
        ],
      );

  void applyChangesToParentAndChild(HobbyLevel newSelectedLevel) {
    internalSelectedHobbyLevel = newSelectedLevel;
    widget.changeSelectionFunc(newSelectedLevel);
  }
}
