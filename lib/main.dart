import 'package:flutter/material.dart';
import 'package:rick_morty_flutter_app/ui/pages/responsive_page.dart';

import 'ui/pages/listCharecters.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(DevicePreview(builder: (context) => MyApp()));

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
      home: ResponsivePage(),
    );
  }
}
