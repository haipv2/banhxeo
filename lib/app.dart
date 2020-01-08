import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';
import 'page/router.dart';
import 'provider/home_provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
//  BaseModel baseModel = locator<BaseModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
//      initialRoute: 'init',
      onGenerateRoute: Router.generateRoute,
      home: MultiProvider(
        providers: [
        ],
        child: HomePage(),
      ),
    );
  }
}
