import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_flutter_app/ui/ressources/responsive/device_screen_type.dart';
import 'package:rick_morty_flutter_app/ui/ressources/wigdets/base_widget.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      if(sizingInformation.deviceScreenType ==  DeviceScreenType.Mobile) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.purple,
            child: Icon(Icons.print),
          ),
            body: Center(
          child: Text(sizingInformation.toString()),
        ));
      } else {
        return Scaffold(
          body: Text("Toto"),
        );
      }
    });
  }

}