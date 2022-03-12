import 'package:continental_poc/Model/model_data.dart';
import 'package:continental_poc/service.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  @override
  Future<List<JsonData>> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<JsonData>> fetchData();
}
