import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/club/bloc/bloc.dart';
import 'package:soccer_frontend/club/screens/club_detail.dart';
import 'package:soccer_frontend/club/screens/screens.dart';

class ClubList extends StatelessWidget {
  static const routeName = '/clubs/list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubs'),
      ),
      body: BlocBuilder<ClubBloc, ClubState>(
        builder: (_, state) {
          if (state is ClubLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ClubLoadSuccess) {
            final clubs = state.clubs;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${clubs[index].clubName}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        ClubAddUpdate.routeName,
                        (route) => false,
                        arguments: state.clubs[index],
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      ClubDetail.routeName,
                      (route) => false,
                      arguments: state.clubs[index],
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: Text('Failed To Load Clubs'),
          );
        },
      ),
    );
  }
}
