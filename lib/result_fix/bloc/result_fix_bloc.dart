import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/result_fix/bloc/bloc.dart';
import 'package:soccer_frontend/result_fix/repository/repository.dart';

class ResultFixBloc extends Bloc<ResultFixEvent, ResultFixState> {
  ResultFixBloc({this.resultFixRepository})
      : assert(resultFixRepository != null),
        super(ResultFixUninitialized());
  final ResultFixRepository resultFixRepository;

  @override
  Stream<ResultFixState> mapEventToState(ResultFixEvent event) async* {
    if (event is ResultFixLoad) {
      yield ResultFixLoading();
      try {
        final resultFixs = await resultFixRepository.getResultFix();
        yield ResultFixLoadSuccess(resultFixs);
      } catch (_) {
        yield ResultFixOperationFailure();
      }
    }
    if (event is ResultFixCreate) {
      try {
        await resultFixRepository.createResultFix(event.resultFix);
        final resultFixs = await resultFixRepository.getResultFix();
        yield ResultFixLoadSuccess(resultFixs);
      } catch (_) {
        yield ResultFixOperationFailure();
      }
    }
    if (event is ResultFixUpdate) {
      try {
        await resultFixRepository.updateResultFix(event.resultFix);
        final resultFixs = await resultFixRepository.getResultFix();
        yield ResultFixLoadSuccess(resultFixs);
      } catch (_) {
        yield ResultFixOperationFailure();
      }
    }
    if (event is ResultFixDelete) {
      try {
        await resultFixRepository.deleteResultFix(event.resultFix.id);
        final resultFixs = await resultFixRepository.getResultFix();
        yield ResultFixLoadSuccess(resultFixs);
      } catch (_) {
        yield ResultFixOperationFailure();
      }
    }
  }
}
