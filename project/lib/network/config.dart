// File config
// @project lms_elearning
// @author dainq on 15-07-2021

import 'package:network/network.dart';

class BuildConfig with ConfigMixin implements Config {
  BuildConfig._({
    this.connectTimeout,
    this.receiveTimeout,
    this.socketUrl,
    required this.baseUrl,
  });

  static BuildConfig? _singleton;
  static final localUrl = "http://127.0.0.1/";
  static final mainUrl = "http://35.198.226.220";

  factory BuildConfig([FlavorConfig? flavorConfig = FlavorConfig.dev]) {
    if (_singleton != null) return _singleton!;
    assert(flavorConfig != null, "flavorConfig required");
    _singleton = flavorConfig?.config;
    return _singleton!;
  }

  BuildConfig._dev() : this._(baseUrl: localUrl);

  BuildConfig._release() : this._(baseUrl: localUrl);

  @override
  int? connectTimeout;

  @override
  int? receiveTimeout;

  @override
  String? socketUrl;

  @override
  String? baseUrl;
}

enum FlavorConfig { dev, release }

extension FlavorConfigExtension on FlavorConfig {
  BuildConfig get config {
    switch (this) {
      case FlavorConfig.dev:
        return BuildConfig._dev();
      case FlavorConfig.release:
        return BuildConfig._release();
    }
  }
}
