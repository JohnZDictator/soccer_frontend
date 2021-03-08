import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/club/bloc/club_event.dart';
import 'package:soccer_frontend/club/bloc/club_state.dart';
import 'package:soccer_frontend/club/repository/repository.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final ClubRepository clubRepository;
  ClubBloc({@required this.clubRepository})
      : assert(clubRepository != null),
        super(ClubUninitializedState());

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is ClubLoad) {
      yield ClubLoading();
      try {
        final clubs = await clubRepository.getClubs();
        yield ClubLoadSuccess(clubs);
      } catch (_) {
        yield ClubOperationFailure();
      }
    }

    if (event is ClubCreate) {
      try {
        await clubRepository.createClub(event.club);
        final clubs = await clubRepository.getClubs();
        yield ClubLoadSuccess(clubs);
      } catch (_) {
        yield ClubOperationFailure();
      }
    }

    if (event is ClubUpdate) {
      try {
        await clubRepository.updateClub(event.club);
        final clubs = await clubRepository.getClubs();
        yield ClubLoadSuccess(clubs);
      } catch (_) {
        yield ClubOperationFailure();
      }
    }

    if (event is ClubDelete) {
      try {
        await clubRepository.deleteClub(event.club.id);
        final clubs = await clubRepository.getClubs();
        yield ClubLoadSuccess(clubs);
      } catch (_) {
        yield ClubOperationFailure();
      }
    }
  }
}
