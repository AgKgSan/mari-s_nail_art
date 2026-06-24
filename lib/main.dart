import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mari_nail_art/core/theme/dark_theme.dart';
import 'package:mari_nail_art/core/theme/light_theme.dart';
import 'package:mari_nail_art/init_app.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final httpClient = http.Client();
  runApp(MyApp(sharedPreferences: sharedPreferences, httpClient: httpClient));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final http.Client httpClient;
  const MyApp({
    super.key,
    required this.sharedPreferences,
    required this.httpClient,
  });
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   title: 'Flutter Demo',
    //   theme: LightTheme.lightTheme,
    //   darkTheme: DarkTheme.darkTheme,
    //   routerConfig: AppRouter.router,
    // );
    return initApp(
      httpClient: httpClient,
      sharedPreferences: sharedPreferences,
      app: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: LightTheme.lightTheme,
            darkTheme: DarkTheme.darkTheme,
            routerConfig: AppRouter.router(),
          );
        },
      ),
    );
  }
}
