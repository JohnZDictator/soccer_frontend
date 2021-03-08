import 'package:soccer_frontend/result_fix/data_provider/data_provider.dart';
import 'package:soccer_frontend/result_fix/models/result_fix.dart';

class ResultFixRepository {
  ResultFixRepository({this.resultFixDataProvider})
      : assert(resultFixDataProvider != null);
  final ResultFixDataProvider resultFixDataProvider;

  Future<List<ResultFix>> getResultFix() async {
    return await resultFixDataProvider.getResultFix();
  }

  Future<ResultFix> getResultFixById(int id) async {
    return await resultFixDataProvider.getResultFixById(id);
  }

  Future<ResultFix> createResultFix(ResultFix resultFix) async {
    return await resultFixDataProvider.createResultFix(resultFix);
  }

  Future<void> updateResultFix(ResultFix resultFix) async {
    return await resultFixDataProvider.updateResultFix(resultFix);
  }

  Future<void> deleteResultFix(int id) async {
    return await resultFixDataProvider.deleteResultFix(id);
  }
}
