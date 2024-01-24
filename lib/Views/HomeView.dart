import 'package:flutter/material.dart';

import '../Data/HiveController.dart';
import '../Models/Hobby.dart';
import 'FavouritesView.dart';
import 'SubViews/HomeSingleHobbyTile.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  Iterable<Hobby> hobbies = [];

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: HiveController.getHobbies(),
        builder: (context, snapshot) => !snapshot.hasData
            ? const CircularProgressIndicator()
            : Scaffold(
                appBar: AppBar(title: const Text("Home")),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.requireData.length,
                          itemBuilder: (context, index) => HomeSingleHobbyTile(
                              hobby: snapshot.requireData.elementAt(index))),
                      ElevatedButton(
                          onPressed: () => navigateToFav(),
                          child: const Text("Go To Favourite")),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => refreshPage(),
                          child: const Text("Refresh"))
                    ],
                  ),
                )),
      );

  void refreshPage() => setState(() {});

  void navigateToFav() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const FavouritesView()));
}
