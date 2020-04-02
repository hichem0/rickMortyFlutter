import 'package:flutter/cupertino.dart';
import 'package:rick_morty_flutter_app/ui/ressources/responsive/sizing_information.dart';
import 'package:rick_morty_flutter_app/ui/ressources/responsive/ui_utils.dart';

class BaseWidget extends StatelessWidget{

  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key key, this.builder}): super(key: key);


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, boxSizing){
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: UIUtils.getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight)
      );
      return builder(context, sizingInformation);
    });
  }

}