import 'package:flutter/material.dart';

import '../Data/HiveController.dart';
import 'SubViews/FavouriteHobbyTile.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourites")),
      body: FutureBuilder(
          future: HiveController.getFavourites(),
          builder: (context, snapshot) => !snapshot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.requireData.length,
                  itemBuilder: (context, index) => FavouriteHobbyTile(
                      favouriteHobby: snapshot.requireData.elementAt(index)))),
    );
  }
}
