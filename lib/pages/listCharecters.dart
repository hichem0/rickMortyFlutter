
import 'dart:convert';
import 'package:flutter/material.dart';
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
 Future<CharacterList> _listCharecters;

  @override
  void initState() {
    super.initState();
    _listCharecters = CharacterRepository().getAllCharacter();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Pokemons")),
        body: SafeArea(
          bottom: true,
          child: FutureBuilder(
            future: _listCharecters,
            builder: (BuildContext context, AsyncSnapshot<CharacterList> data) {
              if (data.hasData) {
                List<Results> items = data.data.results;
                return ListView.separated(
                    itemBuilder: (context, position) {
                      return ListTile(
                        title: Text(
                          "#$position"+" "+items.elementAt(position).name,
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        /*leading: CircleAvatar(
    backgroundImage: _pokemonList.elementAt(position).image
    ),
    onTap: () {
    Navigator.pushNamed(context, pokemonDetails.routeName,
    arguments: {"pokemon": _pokemonList.elementAt(position)});
    }*/
                      );
                    },
                    separatorBuilder: (context, position) {
                      //return Divider();
                      return Container(
                        margin: EdgeInsets.only(left: 3),
                        height: 8,
                      );
                    },
                    itemCount: items.length);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
    /*ListView.separated(
            itemBuilder: (context, position) {
              return ListTile(
                title: Text(
                  "#$position"+" "+_pokemonList.elementAt(position).name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundImage: _pokemonList.elementAt(position).image
                ),
                onTap: () {
                  Navigator.pushNamed(context, pokemonDetails.routeName,
                      arguments: {"pokemon": _pokemonList.elementAt(position)});
                }
              );
            },
            separatorBuilder: (context, position) {
              //return Divider();
              return Container(
                margin: EdgeInsets.only(left: 3),
                height: 8,
              );
            },
            itemCount: _pokemonList.length));
  }*/
  }
}