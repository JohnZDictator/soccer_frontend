import 'package:flutter/material.dart';
import 'package:soccer_frontend/club/models/club.dart';
import 'package:soccer_frontend/club/screens/club_add_update.dart';
import 'package:soccer_frontend/club/screens/club_detail.dart';
import 'package:soccer_frontend/club/screens/club_list.dart';

class ClubAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == ClubList.routeName) {
      return MaterialPageRoute(
        builder: (context) => ClubList(),
      );
    }
    if (settings.name == ClubAddUpdate.routeName) {
      ClubArgument args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ClubAddUpdate(
          args: args,
        ),
      );
    }
    if (settings.name == ClubDetail.routeName) {
      Club club = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ClubDetail(
          club: club,
        ),
      );
    }

    return MaterialPageRoute(
      builder: (context) => ClubList(),
    );
  }
}

class ClubArgument {
  Club club;
  bool edit;
  ClubArgument({this.club, this.edit});
}
