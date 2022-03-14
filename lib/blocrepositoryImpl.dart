import 'package:continental_poc/Model/CountriesResponse.dart';
import 'package:continental_poc/service.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoService service = TodoService();

  @override
  Future<CountriesResponse> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<CountriesResponse> fetchData();
}
