import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/club/bloc/bloc.dart';
import 'package:soccer_frontend/club/screens/club_detail.dart';
import 'package:soccer_frontend/club/screens/screens.dart';

class ClubList extends StatefulWidget {
  static const routeName = '/v1/club';
  @override
  _ClubListState createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubs'),
      ),
      body: BlocBuilder<ClubBloc, ClubState>(
        builder: (_, state) {
          if (state is ClubOperationFailure) {
            return Center(
              child: Text('Failed To Load Clubs'),
            );
          }

          if (state is ClubLoadSuccess) {
            final clubs = state.clubs;
            return ListView.builder(
              itemCount: clubs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${clubs[index].clubName}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          // final clubEvent = ClubDelete(clubs[index]);
                          // BlocProvider.of<ClubBloc>(context).add(clubEvent);
                          Navigator.of(context).pushNamed(
                            ClubAddUpdate.routeName,
                            arguments:
                                ClubArgument(club: clubs[index], edit: true),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          final clubEvent = ClubDelete(clubs[index]);
                          BlocProvider.of<ClubBloc>(context).add(clubEvent);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ClubDetail.routeName,
                      arguments: state.clubs[index],
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          ClubAddUpdate.routeName,
          arguments: ClubArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
