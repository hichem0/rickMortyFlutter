import 'package:flutter/widgets.dart';
import 'package:rick_morty_flutter_app/ui/resources/responsive/device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation(
      {this.deviceType,
      this.orientation,
      this.localWidgetSize,
      this.screenSize});

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
