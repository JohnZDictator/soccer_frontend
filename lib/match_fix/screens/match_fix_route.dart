import 'package:flutter/material.dart';
import 'package:soccer_frontend/match_fix/models/match_fix.dart';
import 'package:soccer_frontend/match_fix/screens/screens.dart';

class MatchFixAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == MatchFixList.routeName) {
      return MaterialPageRoute(
        builder: (context) => MatchFixList(),
      );
    }
    if (settings.name == MatchFixAddUpdate.routeName) {
      MatchFixArgument args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => MatchFixAddUpdate(
          args: args,
        ),
      );
    }
    if (settings.name == MatchFixDetail.routeName) {
      MatchFix args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => MatchFixDetail(
          args: args,
        ),
      );
    }

    return MaterialPageRoute(
      builder: (context) => MatchFixList(),
    );
  }
}

class MatchFixArgument {
  MatchFix matchFix;
  bool edit;
  MatchFixArgument({this.matchFix, this.edit});
}
