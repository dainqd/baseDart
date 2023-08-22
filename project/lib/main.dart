import 'package:common/common.dart';
import 'package:example/auth/AuthServiceImpl.dart';
import 'package:example/generated/l10n.dart';
import 'package:example/network/config.dart';
import 'package:example/src/home/ui/app_home.dart';
import 'package:example/src/login/ui/login.dart';
import 'package:flutter/material.dart';


SharedPreferences? shared;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BuildConfig(FlavorConfig.release);
  configure();
  shared = await SharedPreferences.getInstance();
  Translate.delegate.setShared(shared);
  Log.init();
  runApp(WrapperApplication(authService: AuthServiceImpl(shared), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with MaterialAppMixin, LocalizationMixin, ThemeMixin {
  @override
  String get title => Translate.current.app_title;

  @override
  Widget get home => AuthConsumer(
        isAuth: true,
        home: () => const AppHome(),
        login: () => const Login(),
      );

  @override
  LocalizationsDelegate get delegate => Translate.delegate;

  @override
  Iterable<Locale> get supportedLocales => Translate.delegate.supportedLocales;
}
