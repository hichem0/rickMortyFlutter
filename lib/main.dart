import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterDetails.dart';
import 'package:rick_morty_flutter_app/data/model/CharacterList.dart';
import 'package:rick_morty_flutter_app/data/repository/characterRepository.dart';

import 'pages/listCharecters.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        ListCharecters.routeName: (BuildContext context) => ListCharecters(),
      },
      home: ListCharecters(),
    );
  }
}