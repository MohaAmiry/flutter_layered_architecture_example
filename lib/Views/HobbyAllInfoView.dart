import 'package:flutter/material.dart';

import '../Models/Hobby.dart';
import 'AboutUs.dart';
import 'AddNewHobbyView.dart';
import 'FavouritesView.dart';
import 'SubViews/HobbyInformationTile.dart';

class HobbyAllInfoView extends StatelessWidget {
  final Hobby hobby;

  const HobbyAllInfoView({Key? key, required this.hobby}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Hobby Information")),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Text("Hobbies App")),
              TextButton(
                  onPressed: () => navigateTo(context, const FavouritesView()),
                  child: const Text("Go To Favourite")),
              TextButton(
                  onPressed: () => navigateTo(context, const AddNewHobbyView()),
                  child: const Text("Add Hobby")),
              TextButton(
                  onPressed: () => navigateTo(context, const AboutUsView()),
                  child: const Text("About Us")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Go Back"))
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              HobbyInformationTile(hobby: hobby),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Go Back"))
            ],
          ),
        ),
      );

  void navigateTo(BuildContext context, Widget to) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => to));
}
