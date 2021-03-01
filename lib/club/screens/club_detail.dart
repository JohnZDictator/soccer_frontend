import 'package:flutter/material.dart';
import 'package:soccer_frontend/club/models/club.dart';

class ClubDetail extends StatelessWidget {
  static const routeName = '/clubs/detail';
  final Club club;

  ClubDetail({this.club});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Club Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ClubId: ${club.id}'),
          Text('ClubName: ${club.clubName}'),
        ],
      ),
    );
  }
}
