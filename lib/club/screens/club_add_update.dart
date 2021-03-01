import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/club/bloc/bloc.dart';
import 'package:soccer_frontend/club/bloc/club_event.dart';
import 'package:soccer_frontend/club/models/models.dart';
import 'package:soccer_frontend/club/screens/club_list.dart';
import 'package:soccer_frontend/club/screens/club_route.dart';

class ClubAddUpdate extends StatefulWidget {
  static const routeName = '/clubs/add_update';
  final ClubArgument args;

  ClubAddUpdate({this.args});

  @override
  _ClubAddUpdateState createState() => _ClubAddUpdateState();
}

class _ClubAddUpdateState extends State<ClubAddUpdate> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _clubs = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? 'Edit Club' : 'Add New Club'}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: widget.args.edit ? widget.args.club.clubName : '',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter ClubName';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Club Name'),
                onSaved: (value) {
                  setState(() {
                    this._clubs['clubName'] = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  label: Text('Save'),
                  icon: Icon(Icons.save),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final ClubEvent clubEvent = widget.args.edit
                          ? ClubUpdate(
                              Club(
                                id: widget.args.club.id,
                                clubName: widget.args.club.clubName,
                              ),
                            )
                          : ClubCreate(
                              Club(
                                clubName: widget.args.club.clubName,
                              ),
                            );
                      BlocProvider.of<ClubBloc>(context).add(clubEvent);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          ClubList.routeName, (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
