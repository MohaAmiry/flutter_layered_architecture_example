import 'package:flutter/material.dart';
import 'package:flutter_layered_architecture_example/ExtensionMethods.dart';

import '../Data/HiveController.dart';
import '../Models/AvailableHobbiesIcons.dart';
import '../Models/Hobby.dart';

class AddNewHobbyView extends StatefulWidget {
  const AddNewHobbyView({Key? key}) : super(key: key);

  @override
  State<AddNewHobbyView> createState() => AddNewHobbyViewState();
}

class AddNewHobbyViewState extends State<AddNewHobbyView> {
  TextEditingController hobbyNameController = TextEditingController();
  TextEditingController hobbyDescController = TextEditingController();
  TextEditingController hobbyBenefitsController = TextEditingController();
  TextEditingController hobbyAgeController = TextEditingController();
  int selectedHobbyIconIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Hobby")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: hobbyNameController,
              decoration: const InputDecoration(
                  hintText: "New Hobby Name", labelText: "New Hobby Name")),
          TextField(
              controller: hobbyDescController,
              decoration: const InputDecoration(
                  hintText: "New Hobby Description",
                  labelText: "New Hobby Description")),
          TextField(
              controller: hobbyBenefitsController,
              decoration: const InputDecoration(
                  hintText: "New Hobby Benefits",
                  labelText: "New Hobby Benefits")),
          TextField(
              controller: hobbyAgeController,
              decoration: const InputDecoration(
                  hintText: "New Hobby Minimal Age",
                  labelText: "New Hobby Minimal Age")),
          const SizedBox(height: 10),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ListView.builder(
                  itemCount: availableHobbiesIcons.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () => selectedHobbyIconIndex = index,
                        title: Icon(availableHobbiesIcons.elementAt(index)));
                  })),
          const SizedBox(height: 10),
          Row(
            children: [
              TextButton(
                  onPressed: () => _addNewHobby(),
                  child: const Text("Confirm")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _addNewHobby() async {
    await HiveController.addHobby(_constructHobby());
    Navigator.pop(context);
  }

  Hobby _constructHobby() => Hobby(
      hobbyNameController.value.text,
      hobbyDescController.value.text,
      hobbyBenefitsController.value.text,
      hobbyAgeController.value.text.parseToInt(),
      selectedHobbyIconIndex);
}
