import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/stadium/models/models.dart';

class StadiumBloc extends Bloc<StadiumEvent, StadiumState> {
  StadiumBloc({this.stadiumRepository})
      : assert(stadiumRepository != null),
        super(StadiumStateUninitialized());
  final StadiumRepository stadiumRepository;

  @override
  Stream<StadiumState> mapEventToState(StadiumEvent event) async* {
    if (event is StadiumLoad) {
      yield StadiumLoading();
      try {
        final stadiums = await stadiumRepository.getStadium();
        yield StadiumLoadSuccess(stadiums);
      } catch (_) {
        yield StadiumOperationFailure();
      }
    }
    if (event is StadiumCreate) {
      try {
        await stadiumRepository.createStadium(event.stadium);
        final stadiums = await stadiumRepository.getStadium();
        yield StadiumLoadSuccess(stadiums);
      } catch (_) {
        yield StadiumOperationFailure();
      }
    }
    if (event is StadiumUpdate) {
      try {
        await stadiumRepository.updateStadium(event.stadium);
        final stadiums = await stadiumRepository.getStadium();
        yield StadiumLoadSuccess(stadiums);
      } catch (_) {
        yield StadiumOperationFailure();
      }
    }
    if (event is StadiumDelete) {
      try {
        await stadiumRepository.deleteStadium(event.stadium.id);
        final stadiums = await stadiumRepository.getStadium();
        yield StadiumLoadSuccess(stadiums);
      } catch (_) {
        yield StadiumOperationFailure();
      }
    }
  }
}
