import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';

import '../Data/HiveController.dart';
import '../Models/AvailableHobbiesIcons.dart';
import '../Models/Favourite.dart';
import '../Models/Hobby.dart';
import '../Models/HobbyLevels.dart';
import 'SubViews/HobbyLevelSelect.dart';

class AddHobbyToFavouriteView extends StatefulWidget {
  final Hobby hobby;

  const AddHobbyToFavouriteView({Key? key, required this.hobby})
      : super(key: key);

  @override
  State<AddHobbyToFavouriteView> createState() =>
      _AddHobbyToFavouriteViewState();
}

class _AddHobbyToFavouriteViewState extends State<AddHobbyToFavouriteView> {
  GlobalKey<HobbyLevelSelectState> selectedLevelState = GlobalKey();
  DateTime selectedDate = DateTime.now();
  HobbyLevel selectedHobbyLevel = HobbyLevel.junior;
  int x = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Hobby To Favourite")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hobby Name: ${widget.hobby.hobbyName}"),
          Text("Hobby Description: ${widget.hobby.hobbyDesc}"),
          Text("Hobby Benefits: ${widget.hobby.benefits}"),
          Text("Hobby Minimum Age: ${widget.hobby.minAge.toString()}"),
          availableHobbiesIcons.getIconByIndex(widget.hobby.hobbyIconIndex),
          HobbyLevelSelect(
              key: selectedLevelState, changeSelectionFunc: changeSelection),
          ElevatedButton(
              onPressed: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now())
                  .then((value) => selectedDate = value!),
              child: const Text("Insert A Hobby Start Date")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                await HiveController.addHobbyToFavorite(
                    constructFavouriteHobby());
                Navigator.pop(context);
              },
              child: const Text("Add To Favourite"))
        ],
      ),
    );
  }

  void changeSelection(HobbyLevel newSelection) {
    setState(() {
      selectedHobbyLevel = newSelection;
    });
  }

  Favourite constructFavouriteHobby() =>
      Favourite(widget.hobby, selectedHobbyLevel, selectedDate);
}
