
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:rick_morty_flutter_app/data/model/results.dart';
import 'package:rick_morty_flutter_app/data/provider/characterProvider.dart';
import 'package:rick_morty_flutter_app/data/repository/characterRepository.dart';

class ListCharecters extends StatefulWidget {
  static const String routeName = "/characters";
  ListCharecters({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<ListCharecters> {
 Future<CharacterDetails> _character;

  @override
  void initState() {
    super.initState();
    _character = CharacterRepository().getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Characters")),
        body: SafeArea(
          bottom: true,
          child: FutureBuilder(
            future: _character,
            builder: (BuildContext context, AsyncSnapshot<CharacterDetails> data) {
              if (data.hasData) {
                CharacterDetails test = data.data;
                return Text("Hola");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}