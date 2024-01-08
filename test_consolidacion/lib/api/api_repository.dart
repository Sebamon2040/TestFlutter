
import 'api_provider.dart';
import '../models/breed_model.dart';


class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Data>> fetchBreeds({int page = 1}) {
    return _provider.fetchBreeds(page: page).then((breed) => breed.data ?? []);
  }
}

class NetworkError extends Error {}