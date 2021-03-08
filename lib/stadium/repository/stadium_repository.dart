import 'package:flutter/material.dart';
import 'package:soccer_frontend/stadium/models/models.dart';
import 'package:soccer_frontend/stadium/models/stadium.dart';

class StadiumRepository {
  StadiumRepository({@required this.stadiumDataProvider})
      : assert(stadiumDataProvider != null);
  final StadiumDataProvider stadiumDataProvider;

  Future<List<Stadium>> getStadium() async {
    return await stadiumDataProvider.getStadium();
  }

  Future<Stadium> getStadiumById(int id) async {
    return await stadiumDataProvider.getStadiumById(id);
  }

  Future<Stadium> createStadium(Stadium stadium) async {
    return await stadiumDataProvider.createStadium(stadium);
  }

  Future<void> updateStadium(Stadium stadium) async {
    return await stadiumDataProvider.updateStadium(stadium);
  }

  Future<void> deleteStadium(int id) async {
    return await stadiumDataProvider.deleteStadium(id);
  }
}
