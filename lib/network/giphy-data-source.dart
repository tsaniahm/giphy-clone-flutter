import 'base-network.dart';

class GiphyDataSource {
  static GiphyDataSource instance = GiphyDataSource();

  Future<Map<String, dynamic>> loadGiphy() {
    return BaseNetwork.get();
  }
}