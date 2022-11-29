import 'package:flutter/cupertino.dart';
import 'package:localpath/resource/Resources.dart';
import 'package:localpath/resource/dimentions/AppDimension.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}