import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:org_parser_example/data/repository/file_repository.dart';
import 'package:org_parser_example/data/repository/preference_repository.dart';
import 'package:org_parser_example/ui/home/home_view.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:org_parser_example/ui/preference/preference_view.dart';
import 'package:org_parser_example/ui/preference/preference_view_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<PreferenceRepository>(
          create: (_) => PreferenceRepository(),
        ),
        Provider<FileRepository>(
          create: (_) => FileRepository(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ja', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => StateNotifierProvider<HomeViewStateNotifier, HomeViewState>(
              create: (_) => HomeViewStateNotifier(),
              child: HomeView(),
            ),
        '/preference': (_) => StateNotifierProvider<PreferenceViewStateNotifier,
                PreferenceViewState>(
              create: (_) => PreferenceViewStateNotifier(),
              child: PreferenceView(),
            ),
      },
    );
  }
}
