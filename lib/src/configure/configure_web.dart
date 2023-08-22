// File configure_web
// @project flutter-base-bloc-localization-dio
// @author dainq on 17-07-2021

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}