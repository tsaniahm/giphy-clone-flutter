import 'base-network.dart';

class GiphyDataSource {
  static GiphyDataSource instance = GiphyDataSource();

  Future<Map<String, dynamic>> loadCountries() {
    return BaseNetwork.get();
  }
}