import 'package:flutter/material.dart';

import 'home_page.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center (
            child: Text('No toure defined for ${settings.name}'),
          ),
        ));
    }
  }
}
