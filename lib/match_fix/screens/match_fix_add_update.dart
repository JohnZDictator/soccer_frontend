import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:soccer_frontend/match_fix/screens/screens.dart';

import 'package:intl/intl.dart';

class MatchFixAddUpdate extends StatefulWidget {
  static const routeName = '/v1/matchFix/add_update';
  final MatchFixArgument args;
  MatchFixAddUpdate({this.args});

  @override
  _MatchFixAddUpdateState createState() => _MatchFixAddUpdateState();
}

class _MatchFixAddUpdateState extends State<MatchFixAddUpdate> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _matchFixs = {};

  double _height;
  double _width;
  String _setTime, _setDate;
  String _hour, _minute, _time;
  String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(
              2021,
              03,
              12,
              selectedTime.hour,
              selectedTime.minute,
            ),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
      DateTime(2021, 03, 12, DateTime.now().hour, DateTime.now().minute),
      [hh, ':', nn, " ", am],
    ).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.args.edit ? 'Edit MatchFixture' : 'Add New MatchFixture'}'),
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
                initialValue: widget.args.edit
                    ? widget.args.matchFix.clubs[0].clubName
                    : '',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter First ClubName';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Club Name 1st'),
                onSaved: (value) {
                  setState(() {
                    this._matchFixs['clubName1'] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit
                    ? widget.args.matchFix.clubs[1].clubName
                    : '',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter Second ClubName';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Club Name 2nd'),
                onSaved: (value) {
                  setState(() {
                    this._matchFixs['clubName2'] = value;
                  });
                },
              ),
              TextFormField(
                initialValue: widget.args.edit
                    ? widget.args.matchFix.clubs[0].clubName
                    : '',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter First ClubName';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Club Name 1st'),
                onSaved: (value) {
                  setState(() {
                    this._matchFixs['clubName1'] = value;
                  });
                },
              ),
              Container(
                width: _width,
                height: _height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Choose Date',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            width: _width / 1.7,
                            height: _height / 9,
                            margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _dateController,
                              onSaved: (value) {
                                _setDate = value;
                              },
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.only(top: 0.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Choose Time',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        InkWell(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            width: _width / 1.7,
                            height: _height / 9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              style: TextStyle(fontSize: 40),
                              textAlign: TextAlign.center,
                              onSaved: (String val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeController,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  // labelText: 'Time',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
